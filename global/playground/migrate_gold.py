import os
import glob
import re
import shutil

source_dir = r"c:\Users\Oviks\antigravitygold"
target_dir = r"c:\Users\Oviks\.antigravity"

def format_name(filename):
    name = os.path.basename(filename).replace(".md", "")
    if name.startswith("skill-"):
        name = name[6:]
    return name

def extract_metadata(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
            
    # Try to extract a title
    title = format_name(filepath).replace("-", " ").title()
    for line in content.split('\n'):
        if line.startswith("# SKILL:") or line.startswith("# CORE:"):
             title = line.replace("# SKILL:", "").replace("# CORE:", "").strip()
             break
        elif line.startswith("# "):
             title = line.replace("# ", "").strip()
             break

    # Try to extract description
    desc = f"Domain knowledge for {title}"
    match = re.search(r'\*\*Primary Directive:\*\*\s*(.*?)(?=\n\n|\n\*\*|\n#)', content, re.DOTALL)
    if match:
        desc = match.group(1).replace('\n', ' ').strip()
        # Ensure description is short enough for YAML frontmatter
        if len(desc) > 150:
             desc = desc[:147] + "..."
             
    return title, desc, content

def migrate_files(subdir, is_skill=True):
    src_path = os.path.join(source_dir, subdir)
    tgt_path = os.path.join(target_dir, subdir)
    
    os.makedirs(tgt_path, exist_ok=True)
    files = glob.glob(os.path.join(src_path, "*.md"))
    
    for f in files:
        base_name = format_name(f)
        title, desc, content = extract_metadata(f)
        
        # Determine target structure
        if is_skill:
            # Skills need a folder and a SKILL.md file
            skill_folder = os.path.join(tgt_path, base_name)
            os.makedirs(skill_folder, exist_ok=True)
            target_file = os.path.join(skill_folder, "SKILL.md")
            
            # Add YAML frontmatter for skills
            frontmatter = f"---\nname: {title}\ndescription: {desc}\n---\n\n"
            final_content = frontmatter + content
        else:
            # Core files can just be copied to the core directory
            # but let's give them the same frontmatter treatment if they are meant to be skills
            # If they are just reference files, flat copy is fine. Let's assume flat copy for core.
             target_file = os.path.join(tgt_path, os.path.basename(f))
             final_content = content
             
        with open(target_file, "w", encoding="utf-8") as out:
            out.write(final_content)
            
        print(f"Migrated {'Skill' if is_skill else 'Core'}: {base_name} -> {target_file}")

# Execute migration
print("Starting migration...")
migrate_files("skills", is_skill=True)
migrate_files("core", is_skill=False)
print("Migration complete!")
