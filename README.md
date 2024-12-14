DnDGame on Solana
Welcome to the DnDGame, a blockchain-based RPG battle simulation powered by the Solana network. This README will guide you through the installation and setup process to run the project locally.

Features
Create and customize characters with unique attributes.
Engage in battles against dynamically generated enemies.
Transparent and fair battle outcomes using decentralized randomness.
Fully decentralized and fast transactions via Solana blockchain.
Prerequisites
System Requirements:

Node.js (v16+ recommended)
npm or yarn
Solana CLI (for deploying contracts)
Phantom Wallet (for testing)
Clone the Repository:

bash
Kodu kopyala
git clone https://github.com/your-username/dndgame  
cd dndgame  
Step 1: Backend Setup (Smart Contracts)
Install dependencies:

bash
Kodu kopyala
npm install  
Compile smart contracts:

bash
Kodu kopyala
solana build  
Deploy to Solana testnet:

bash
Kodu kopyala
solana deploy dist/program/dndgame.so  
Note the program ID after deployment for frontend integration.

Step 2: Frontend Setup
Navigate to the frontend directory:

bash
Kodu kopyala
cd frontend  
Install frontend dependencies:

bash
Kodu kopyala
npm install  
Update the .env file:
Add your deployed smart contract program ID and Solana cluster details:

env
Kodu kopyala
REACT_APP_SOLANA_NETWORK=https://api.testnet.solana.com  
REACT_APP_PROGRAM_ID=your-program-id  
Start the development server:

npm start  
Step 3: Test the Application
Open your browser and navigate to http://localhost:3000.
Connect your Phantom wallet.
Create a character, spawn enemies, and start battling!
Step 4: Deployment
Build the frontend:

bash
npm run build  
Deploy the frontend (e.g., to Vercel or Netlify).

Contributing
Contributions are welcome! Feel free to submit issues or pull requests to improve the project.

License
This project is licensed under the MIT License.

Enjoy playing DnDGame and explore the possibilities of blockchain gaming! 


Project Name: DnDGame

Name: 
Ali Sürmeli
İsmail Varol
Alp Kutay Köksal

Project Description:
DnDGame is an interactive, blockchain-based RPG battle simulation built on the Solana network. Players create unique characters with customizable attributes such as health, attack, and defense, and engage in battles against dynamically generated enemies. Each character and enemy is stored as an on-chain entity, ensuring transparency and immutability.

The game integrates decentralized randomness for battle outcomes, enhancing fairness. Players can execute actions like attacking, defending, or escaping, with game logic handled through Solana smart contracts for speed and reliability. Player and enemy statuses, health updates, and battle logs are securely recorded on-chain for verifiability.

This project brings RPG gameplay to Web3, allowing players to experience an engaging, trustless gaming ecosystem while showcasing the speed and low-cost transaction capabilities of Solana. Future upgrades could include multiplayer battles, NFT-based character skins, and play-to-earn mechanics with in-game rewards.

Vision: 
DnDGame aims to revolutionize gaming by merging the immersive storytelling of RPGs with the transparency and innovation of blockchain technology. By leveraging Solana’s speed and efficiency, we envision a future where players fully own their characters and game assets, fostering true digital ownership. This project aspires to set a new standard for fairness in gaming, eliminating centralized control and enhancing trust through decentralized randomness.

DnDGame seeks to empower players worldwide, creating a vibrant Web3 gaming community while showcasing the limitless potential of blockchain in entertainment. Our mission is to inspire innovation and redefine the boundaries of interactive gaming experiences.

Software Development Plan for DnDGame

Step 1: Smart Contract Development

Core Variables:
Characters struct: Store player/enemy stats (name, health, attack, defense, maxHealth).
Player and Enemy: Map user IDs to characters.
BattleState: Record current battle status (health updates, turns).
Core Functions:
createCharacter: Allow users to create and customize characters.
spawnEnemy: Generate enemies with randomized stats.
battleTurn: Handle attack/defense logic, calculate damage, and update health.
getStatus: Retrieve player and enemy states.
escapeBattle: Enable players to exit battles safely.
Features:
Decentralized randomness for battle outcomes.
Transaction-based updates for character creation and battles.
Step 2: Smart Contract Testing

Use Solana testnet and mock scenarios for:
Validating character creation.
Ensuring battle logic correctness.
Testing randomized outcomes for fairness.
Step 3: Backend Integration

Develop APIs to interact with smart contracts:
createCharacterAPI, battleAPI, and getStatusAPI.
Use Solana’s SDK for seamless blockchain communication.
Step 4: Frontend Development

UI/UX Features:
Character creation interface.
Real-time battle simulation with health bars and action prompts.
Player and enemy stats dashboards.
Frameworks/Tools:
React/Next.js for frontend.
TailwindCSS for responsive design.
Wallet integration (e.g., Phantom Wallet) for user authentication.
Step 5: Gameplay Testing

Run end-to-end tests:
Validate user interactions with smart contracts.
Check UI responsiveness and real-time updates.
Collect feedback for refinement.
Step 6: Deployment

Deploy smart contracts on Solana mainnet.
Host frontend on a platform like Vercel or Netlify.
Announce launch with a detailed guide on character creation, gameplay, and blockchain wallet setup.



As a curious child growing up in a small town, I was fascinated by how things worked—tinkering with gadgets, taking apart toys, and dreaming of creating something impactful. My journey led me to study computer engineering, where I discovered my passion for artificial intelligence and blockchain technology. Each project I took on—whether developing AI models or crafting decentralized applications—felt like a step closer to merging creativity with innovation. Today, I aspire to build technology that not only solves problems but also inspires others, transforming ideas into meaningful solutions for a better, more connected future.


