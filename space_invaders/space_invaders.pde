Clock clock = new Clock();
Input input = new Input();
BulletManager bulletManager = new BulletManager();
EnemyManager enemyManager = new EnemyManager();
Shield shield;
Player player;

// State
boolean gameOver;

void setup() {
	size(800, 800);

	player = new Player(400, 740, PLAYER_SIZE.x, PLAYER_SIZE.y, 240);
	shield = new Shield(new PVector(500, 500), 50);

	enemyManager.createEnemyGroup(8, 4, 100, ENEMY_SIZE, ENEMY_SPEED);
}

void update() {
	float deltaTime = clock.tick();

	player.update(deltaTime);
	enemyManager.update(deltaTime);
	bulletManager.update(deltaTime);
}

void draw() {
	update();

	background(0);
	bulletManager.draw();
	shield.draw();
	enemyManager.draw();
	player.draw();

	drawUI();
}

void keyPressed() {
	input.keyPressed();
}

void keyReleased() {
	input.keyReleased();
}

// TODO: Move this to another file.
void drawUI() {
	if (gameOver) {
		fill(255);
		textAlign(CENTER, CENTER);
		textSize(42);
		text("Game Over", width / 2, height / 2);
	}
}