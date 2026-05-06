import React from 'react';
import { motion } from 'motion/react';

/**
 * A Premium OS-style button using Motion for physics-based interaction
 * and TypeScript 7 logic for safety.
 */
interface PremiumButtonProps {
  label: string;
  onClick: () => void;
}

export const PremiumButton: React.FC<PremiumButtonProps> = ({ label, onClick }) => {
  return (
    <motion.button
      // 1. Initial appearance
      style={{
        padding: '12px 24px',
        fontSize: '16px',
        fontWeight: '600',
        borderRadius: '12px',
        border: 'none',
        background: 'linear-gradient(135deg, #6366f1 0%, #a855f7 100%)',
        color: 'white',
        cursor: 'pointer',
        boxShadow: '0 4px 15px rgba(168, 85, 247, 0.3)',
        outline: 'none',
      }}
      
      // 2. Hover Interaction (Glow and Scale)
      whileHover={{ 
        scale: 1.05,
        boxShadow: '0 6px 20px rgba(168, 85, 247, 0.4)',
      }}
      
      // 3. Tap Interaction (Spring Physics)
      whileTap={{ 
        scale: 0.95,
        rotate: '-1deg' 
      }}
      
      // 4. Smooth Transition settings
      transition={{ 
        type: 'spring', 
        stiffness: 400, 
        damping: 17 
      }}
      
      onClick={onClick}
    >
      {label}
    </motion.button>
  );
};
