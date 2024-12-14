import Time "mo:base/Time";
import Int "mo:base/Int";
import Random "mo:base/Random";
import Debug "mo:base/Debug";

actor DnDGame {
  public type Character = {
    name: Text;
    health: Int;
    maxHealth: Int;
    attack: Int;
    defense: Int;
  };

  var player: ?Character = null;
  var enemy: ?Character = null;

  // Validate character creation
  private func validateCharacterStats(health: Int, attack: Int, defense: Int): Bool {
    health > 0 and attack >= 0 and defense >= 0
  };

  // Enhanced character creation with validation
  public func createCharacter(name: Text, health: Int, attack: Int, defense: Int): async ?Character {
    if (validateCharacterStats(health, attack, defense)) {
      return ?{
        name = name;
        health = health;
        attack = attack;
        defense = defense;
        maxHealth = health;
      };
    };
    null
  };

  public func setPlayerCharacter(name: Text, health: Int, attack: Int, defense: Int): async Text {
    switch (await createCharacter(name, health, attack, defense)) {
      case (?newPlayer) {
        player := ?newPlayer;
        return "Player karakteri oluşturuldu: " # name;
      };
      case null {
        return "Geçersiz karakter istatistikleri!";
      };
    };
  };

  public func spawnEnemy(): async Text {
    switch (await createCharacter("Goblin", 50, 10, 5)) {
      case (?newEnemy) {
        enemy := ?newEnemy;
        return "Bir düşman ortaya çıktı: Goblin!";
      };
      case null {
        return "Düşman oluşturulamadı!";
      };
    };
  };

  // Improved battle with player choice
  public func battle(): async Text {
    switch (player, enemy) {
      case (?p, ?e) {
        var playerHealth = p.health;
        var enemyHealth = e.health;

        let randomFactor = func(baseValue: Int): Int {
          let variance = baseValue / 5;
          let randomOffset = Int.abs(((Time.now() % 10) - 5) * variance / 5);
          Int.max(1, baseValue + randomOffset)
        };

        while (playerHealth > 0 and enemyHealth > 0) {
          // Display player and enemy status
          Debug.print("Oyuncu: " # p.name # ", Sağlık: " # Int.toText(playerHealth) # "/" # Int.toText(p.maxHealth));
          Debug.print("Düşman: " # e.name # ", Sağlık: " # Int.toText(enemyHealth));

          // Player chooses action
          Debug.print("Seçenekler: [S]aldır veya [K]aç");
          let playerChoice = "S"; // Simulated choice for testing. Replace with actual input handling.

          if (playerChoice == "K") {
            return "Oyuncu savaştan kaçtı!";
          };

          if (playerChoice == "S") {
            // Player attack
            let playerDamage = randomFactor(p.attack);
            let damageToEnemy = Int.max(0, playerDamage - e.defense);
            enemyHealth := enemyHealth - damageToEnemy;
            Debug.print("Oyuncu saldırdı ve " # Int.toText(damageToEnemy) # " hasar verdi!");

            if (enemyHealth <= 0) {
              return "Düşman yenildi! Tebrikler!";
            };

            // Enemy attack
            let enemyDamage = randomFactor(e.attack);
            let damageToPlayer = Int.max(0, enemyDamage - p.defense);
            playerHealth := playerHealth - damageToPlayer;
            Debug.print("Düşman saldırdı ve " # Int.toText(damageToPlayer) # " hasar verdi!");

            if (playerHealth <= 0) {
              return "Oyuncu yenildi! Şansını tekrar dene.";
            };
          } else {
            Debug.print("Geçersiz seçim. Tekrar deneyin.");
          };
        };

        return "Savaş sona erdi.";
      };
      case _ {
        return "Oyuncu veya düşman mevcut değil.";
      };
    };
  };

  // Keep existing status methods
  public func getPlayerStatus(): async Text {
    switch (player) {
      case (?p) {
        return "Oyuncu: " # p.name # ", Sağlık: " # Int.toText(p.health) # "/" # Int.toText(p.maxHealth);
      };
      case _ {
        return "Oyuncu oluşturulmamış.";
      };
    };
  };

  public func getEnemyStatus(): async Text {
    switch (enemy) {
      case (?e) {
        return "Düşman: " # e.name # ", Sağlık: " # Int.toText(e.health);
      };
      case _ {
        return "Düşman mevcut değil.";
      };
    };
  };
}
