module MyModule::GameScoreboard {

    use aptos_framework::signer;

    /// Struct to hold a player's score
    struct Scoreboard has key {
        score: u64,
    }

    /// Create a new scoreboard for the player with an initial score of 0
    public fun init_scoreboard(player: &signer) {
        assert!(!exists<Scoreboard>(signer::address_of(player)), 1);
        move_to(player, Scoreboard { score: 0 });
    }

    /// Update the player's score by adding points
    public fun update_score(player: &signer, points: u64) acquires Scoreboard {
        let scoreboard = borrow_global_mut<Scoreboard>(signer::address_of(player));
        scoreboard.score = scoreboard.score + points;
    }
}
