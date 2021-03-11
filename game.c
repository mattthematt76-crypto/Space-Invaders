#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "enemy.h"

// Variables
PLAYER player;
BULLET playerbullets[BULLETCOUNT];
BULLET ballbullets[BULLETCOUNT*3];
BALL balls[BALLCOUNT];
BARRIER barriers[BARRIERCOUNT];

int ballsRemaining;
int direction = 0;
int prevdirection = 0;
int playerRemaining;

// Initialize the game
void initGame() {
	initPlayer();
	initBullets();
	initBarriers();
	initBalls();
	unsigned short colors[NUMCOLORS] = {BLACK, RED, GREEN, BLUE, WHITE, GRAY};
	DMANow(3, enemyPal, PALETTE, 256);
	for (int i = 0; i < NUMCOLORS; i++) {
    	PALETTE[256-NUMCOLORS+i] = colors[i];
    }
	ballsRemaining = BALLCOUNT;
	playerRemaining = 1;
}

// Updates the game each frame
void updateGame() {
	updatePlayer();
	for (int i = 0; i < BULLETCOUNT; i++) {
		updatePlayerBullet(&playerbullets[i]);
	}
	for (int i = 0; i < BULLETCOUNT*3; i++) {
		updateBallBullet(&ballbullets[i]);
	}
	for (int i = 0; i < BALLCOUNT; i++) {
		updateBall(&balls[i]);
	}
	for (int i = 0; i < BARRIERCOUNT; i++) {
		updateBarrier(&barriers[i]);
	}
}

// Draws the game each frame
void drawGame() {
	fillScreen4(WHITEID);
	drawPlayer();
	for (int i = 0; i < BULLETCOUNT; i++) {
		drawBullet(&playerbullets[i]);
	}
	for (int i = 0; i < BULLETCOUNT * 3; i++) {
		drawBullet(&ballbullets[i]);
	}
	for (int i = 0; i < BALLCOUNT; i++) {
		drawBall(&balls[i]);
	}
	for (int i = 0; i < BARRIERCOUNT; i++) {
		drawBarrier(&barriers[i]);
	}
}
void initBarriers() {
	for (int i = 0; i < BARRIERCOUNT; i++) {
		barriers[i].width = 20;
		barriers[i].height = 10;
		barriers[i].size = 10;
		barriers[i].row = SCREENHEIGHT - 50;
		barriers[i].col = 110*i;
		barriers[i].color = BLUEID;
		barriers[i].health = 10;
		barriers[i].active = 1;
	}
}
void updateBarrier(BARRIER* b) {
	if (b-> active) {
		for (int i = 0; i < BULLETCOUNT; i++) {
			if (playerbullets[i].active == 1 && playerbullets[i].row + playerbullets[i].height - 1 > b->row && playerbullets[i].row < b->row + b->height - 1 && playerbullets[i].col + playerbullets[i].width - 1 > b->col && playerbullets[i].col < b->col + b->width - 1) {
				playerbullets[i].active = 0;
				b->health = b->health - 1;
			}
		}
		for (int i = 0; i < BULLETCOUNT*3; i++) {
			if (ballbullets[i].active == 1 && ballbullets[i].row + ballbullets[i].height - 1 > b->row && ballbullets[i].row < b->row + b->height - 1 && ballbullets[i].col + ballbullets[i].width - 1 > b->col && ballbullets[i].col < b->col + b->width - 1) {
				ballbullets[i].active = 0;
				b->health = b->health - 1;
			}
		}
	}
}
// // Initialize the cannon
void initPlayer() {
	player.row = 130;
	player.col = 118;
	player.oldCol = player.col;
	player.cdel = 1;
	player.height = 10;
	player.width = 5;
    player.size = 10;
	player.color = GREENID;
	player.bulletTimer = 20;
}
//updates Player
void updatePlayer() {
	if (BUTTON_HELD(BUTTON_LEFT)
		&& 10 <= player.col) {
		player.col -= player.cdel;

	} if (BUTTON_HELD(BUTTON_RIGHT)
		&& SCREENWIDTH - 10 - player.cdel > player.col) {
		player.col += player.cdel;
	}
 	//Fire bullets
	if (BUTTON_PRESSED(BUTTON_B) && player.bulletTimer >= 20) {
 		firePlayerBullet();  
		player.bulletTimer = 0;
	}
	player.bulletTimer++;
	for (int i = 0; i < BULLETCOUNT*3; i++) {
		if (ballbullets[i].active == 1 && ballbullets[i].row + ballbullets[i].height - 1 > player.row && ballbullets[i].row < player.row + player.height - 1 && ballbullets[i].col + ballbullets[i].width - 1 > player.col && ballbullets[i].col < player.col + player.width - 1) {
			ballbullets[i].active = 0;
			playerRemaining = 0;
			ballsRemaining--;
		}
	}
}
//draws Player
void drawPlayer() {
	drawRect4(player.col, player.row, player.width, player.height, player.color);
	player.oldCol = player.col;
}

// Initialize the pool of bullets
void initBullets() {
	for (int i = 0; i < BULLETCOUNT; i++) {
		playerbullets[i].height = 2;
		playerbullets[i].width = 1;
		playerbullets[i].row = -1 * playerbullets->height;
		playerbullets[i].col = 0;
		playerbullets[i].oldRow = player.oldRow;
		playerbullets[i].oldCol = player.oldCol;
		playerbullets[i].rdel = -2;
		playerbullets[i].color = WHITE;
		playerbullets[i].active = 0;
	}
	for (int i = 0; i< BULLETCOUNT * 3; i++) {
		ballbullets[i].height = 2;
		ballbullets[i].width = 1;
		ballbullets[i].row = -1 * playerbullets->height;
		ballbullets[i].col = 0;
		ballbullets[i].oldRow = player.oldRow;
		ballbullets[i].oldCol = player.oldCol;
		ballbullets[i].rdel = -2;
		ballbullets[i].color = WHITE;
		ballbullets[i].active = 0;
	}
}

// Spawn a bullet for player
void firePlayerBullet() {
	for (int i = 0; i < BULLETCOUNT; i++) {
		if (playerbullets[i].active == 0) {
            playerbullets[i].row = player.row;
            playerbullets[i].col = player.col;
            playerbullets[i].active = 1;
            playerbullets[i].erased = 0;
            playerbullets[i].direction = 3;
            break;
		}
	}
}
// Spawn a bullet for enemy
void fireBallBullet(BALL* b) {
	for (int i = 0; i < BULLETCOUNT*3; i++) {
		if (ballbullets[i].active == 0) {
            ballbullets[i].row = b->row;
            ballbullets[i].col = b->col;
            ballbullets[i].active = 1;
            ballbullets[i].erased = 0;
            ballbullets[i].direction = 3;
            break;
		}
	}
}

// // Handle every-frame actions of a bullet
void updatePlayerBullet(BULLET* b) {
    if (b->active) {
		if (b->row + b->height-1 >= 0
            && b->col + b->cdel > 0
            && b->col + b->cdel < SCREENWIDTH-1) {

			b->row += b->rdel;
            b->col += b->cdel;
		} else {
			b->active = 0;
		}
	}
}
//updates enemy bullets
void updateBallBullet(BULLET* b) {
    if (b->active) {
		if (b->row < SCREENHEIGHT) {
			b->row = b->row + 1;
		} else {
			b->active = 0;
		}
	}
}

// // Draw a bullet
void drawBullet(BULLET* b) {
	if(b->active) {
		drawRect4(b->oldCol, b->oldRow, b->width, b->height, BLACK);
		drawRect4(b->col, b->row, b->width, b->height, b->color);
	} 
	else if (!b->erased) {
		drawRect4(b->oldCol, b->oldRow, b->width, b->height, BLACK);
		b->erased = 1;
	}
	b->oldRow = b->row;
	b->oldCol = b->col;
}

// Initialize the balls
void initBalls() {
	int j = 0;
	//row 1
	for (int i = 0; i < BALLCOUNT / 3; i++) {
		balls[i].height = 16;
		balls[i].width = 16;
		balls[i].row = 10;
		balls[i].col = 10 + 20*j;
		balls[i].oldCol = balls[i].col;
		balls[i].rdel = 1;
		balls[i].cdel = 1;
		balls[i].active = 1;
		balls[i].erased = 0;
		balls[i].count = 0;
		balls[i].bulletTimer = rand() % 20;
		balls[i].arrayrow = 1;
		j++;
	}
	j = 0;
	//row 2
	for (int i = BALLCOUNT / 3; i < (BALLCOUNT / 3) * 2; i++) {
		balls[i].height = 16;
		balls[i].width = 16;
		balls[i].row = 25;
		balls[i].col = 10 + 20*j;
		balls[i].oldCol = balls[i].col;
		balls[i].rdel = 1;
		balls[i].cdel = 1;
		balls[i].active = 1;
		balls[i].erased = 0;
		balls[i].count = 0;
		balls[i].bulletTimer = rand() % 20;
		balls[i].arrayrow = 2;
		j++;
	}
	j = 0;
	//row 3
	for (int i = (BALLCOUNT / 3) * 2; i < BALLCOUNT; i++) {
		balls[i].height = 16;
		balls[i].width = 16;
		balls[i].row = 40;
		balls[i].col = 10 + 20*j;
		balls[i].oldCol = balls[i].col;
		balls[i].rdel = 1;
		balls[i].cdel = 1;
		balls[i].active = 1;
		balls[i].erased = 0;
		balls[i].count = 0;
		balls[i].bulletTimer = rand() % 20;
		balls[i].arrayrow = 3;
		j++;
	}
	j = 0;
}

// Handle every-frame actions of a ball
void updateBall(BALL* b) {
	//check to see if a row of enemies is cleared
	int firstRowCleared = 1;
	int secondRowCleared = 1;
	int thirdRowCleared = 1;
	for (int i = 0; i < BALLCOUNT; i++) {
		if (i < BALLCOUNT / 3) {
			if (balls[i].active) {
				firstRowCleared = 0;
			}
		} else if (i >= BALLCOUNT / 3 && i < (BALLCOUNT / 3) * 2) {
			if (balls[i].active) {
				secondRowCleared = 0;
			}
		} else if (i >= (BALLCOUNT / 3) * 2 && i < BALLCOUNT) {
			if (balls[i].active) {
				thirdRowCleared = 0;
			}
		}
	}
	if (b->active) {
		// Bounce the ball off the sides of the box
		if (b->col <= 0)
			for (int i = 0; i < BALLCOUNT; i++) {
				balls[i].cdel = 1;
			}
		else if (b->col + b->width-1 >= SCREENWIDTH-1) {
			for (int i = 0; i < BALLCOUNT; i++) {
				balls[i].cdel = -1;
			}
		}
		//fires bullet depending on enemies remaining
		if (thirdRowCleared == 0) {
			if (b->bulletTimer >= 20 && b->arrayrow == 3) {
				fireBallBullet(b);  
				b->bulletTimer = 0;
			}
		} else if (secondRowCleared == 0) {
			if (b->bulletTimer >= 20 && b->arrayrow == 2) {
				fireBallBullet(b);  
				b->bulletTimer = 0;
			}
		} else if (firstRowCleared == 0) {
			if (b->bulletTimer >= 20 && b->arrayrow == 1) {
				fireBallBullet(b);  
				b->bulletTimer = 0;
			}
		}
		b->bulletTimer++;
		// Move the ball
		b->col += b->cdel;
		// Handle ball-bullet collisions
		for (int i = 0; i < BULLETCOUNT; i++) {
			if (playerbullets[i].active == 1 && playerbullets[i].row + playerbullets[i].height - 1 > b->row && playerbullets[i].row < b->row + b->height - 1 && playerbullets[i].col + playerbullets[i].width - 1 > b->col && playerbullets[i].col < b->col + b->width - 1) {
				playerbullets[i].active = 0;
				b->active = 0;
				ballsRemaining--;
				score += 100;
			}
		}
        if (player.row + player.size - 1 > b->row && player.row < b->row + b->height - 1 && player.col + player.size - 1 > b->col && player.col < b->col + b->width - 1) {
            playerRemaining = 0;
        }
	}
}

// Draw a ball
void drawBall(BALL* b) {
	if(b->active) {
		drawImage4(b->col, b->row, b->width, b->height, enemyBitmap);
	}
}
void drawBarrier(BARRIER* b) {
	if (b->active && b->health > 0) {
		drawRect4(b->col, b->row, b->width, b->height, b->color);
	} else {
		b->active = 0;
	}
}
