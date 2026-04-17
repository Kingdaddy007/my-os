import glob
import os

files = glob.glob(r'c:\Users\Oviks\antigravitygold\skills\*.md')
output = []
for f in files:
    try:
        with open(f, 'r', encoding='utf-8') as file:
            content = file.read()
            lines = content.split('\n')
            
            title = "(No Title)"
            directive = "(No Directive)"
            
            for line in lines:
                if line.startswith("# SKILL:"):
                    title = line.strip()
                    break
                    
            import re
            match = re.search(r'\*\*Primary Directive:\*\*\s*(.*?)(?=\n\n|\n\*\*|\n#)', content, re.DOTALL)
            if match:
                directive = match.group(1).replace('\n', ' ').strip()
            else:
                directive = "Could not find Primary Directive."
                
            output.append(f"### {title}\n**Directive:** {directive}\n")
    except Exception as e:
        output.append(f"### {os.path.basename(f)}\nError reading file: {e}\n")

with open(r'c:\Users\Oviks\.gemini\antigravity\brain\ba112e5e-96e4-4a4a-847e-22c02eee545b\skills_overview.md', 'w', encoding='utf-8') as out:
    out.write("# Skills Overview\n\n" + "\n".join(output))
print("Extraction complete.")
