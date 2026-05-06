import React, { useState } from 'react';
import { motion, AnimatePresence } from 'motion/react';
import { PremiumButton } from './PremiumButton';

const App = () => {
  const [clickCount, setClickCount] = useState(0);

  return (
    <div style={{
      width: '100vw',
      height: '100vh',
      display: 'flex',
      flexDirection: 'column',
      alignItems: 'center',
      justifyContent: 'center',
      background: 'radial-gradient(circle at top right, #1e293b 0%, #0f172a 100%)',
    }}>
      {/* OS Greeting */}
      <motion.h1
        initial={{ opacity: 0, y: -20 }}
        animate={{ opacity: 1, y: 0 }}
        style={{ fontSize: '3rem', marginBottom: '2rem', fontWeight: '800' }}
      >
        Welcome to My OS
      </motion.h1>

      {/* The Premium Button we built */}
      <PremiumButton 
        label="Initialize System" 
        onClick={() => setClickCount(prev => prev + 1)} 
      />

      {/* Dynamic Feedback Area */}
      <div style={{ marginTop: '3rem', height: '100px' }}>
        <AnimatePresence mode="wait">
          <motion.p
            key={clickCount}
            initial={{ opacity: 0, scale: 0.8 }}
            animate={{ opacity: 1, scale: 1 }}
            exit={{ opacity: 0, scale: 1.2 }}
            style={{ fontSize: '1.2rem', color: '#94a3b8' }}
          >
            {clickCount === 0 
              ? "System standby..." 
              : `Pulse detected: ${clickCount} clicks`}
          </motion.p>
        </AnimatePresence>
      </div>
    </div>
  );
};

export default App;
