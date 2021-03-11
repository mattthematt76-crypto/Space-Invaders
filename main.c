#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "start.h"
// variables

// typedef unsigned short u16;
// typedef unsigned char u8;
unsigned short buttons;
unsigned short oldButtons;
typedef unsigned char u8;
int score = 0;
// prototypes
void initialize();
void updateGame();
void setPixel(int, int, unsigned short);
void waitForVBlank();
void drawArrow(u8, u8, u8, u16);

void goToStart();
void goToLose();
void goToWin();
void goToGame();
void goToPause();

void Start();
void Lose();
void Win();
void Game();
void Pause();



// States
enum {START, GAME, PAUSE, WIN, LOSE};
int state;


// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int seed;

//text buffer
char buffer[41];

int main() {

    initialize();
    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
                
        // State Machine  
        switch(state) {
            case START: {
                state = START;
                Start();
                break;
            }
            case PAUSE: {
                state = PAUSE;
                Pause();
                break;
            }
            case LOSE: {
                state = LOSE;
                Lose();
                break;
            }
            case WIN: {
                state = WIN;
                Win();
                break;
            }
            case GAME: {
                state = GAME;
                Game();
                break;
            }
        }
    }
}

// Sets up GBA
void initialize() {
    REG_DISPCTL = MODE4 | BG2_ENABLE | DISP_BACKBUFFER;
    // Set up the first state
    goToStart();
}

void goToStart() {
    //load in color palette
    unsigned short colors[NUMCOLORS] = {BLACK, RED, GREEN, BLUE, WHITE, GRAY};
    DMANow(3, startPal, PALETTE, 256);
    drawFullscreenImage4(startBitmap);
	for (int i = 0; i < NUMCOLORS; i++) {
    	PALETTE[256-NUMCOLORS+i] = colors[i];
    }
    waitForVBlank();
    flipPage();
    seed = 0;
    state = START;
}
void goToPause() {
    fillScreen4(GRAYID);
    drawString4(SCREENWIDTH/2 - 20, SCREENHEIGHT/2, "Paused", WHITEID);
    state = PAUSE;
    waitForVBlank();
    flipPage();
}
void goToWin() {
    score = 0;
    fillScreen4(GREENID);
    drawString4(SCREENWIDTH/2 - 30, SCREENHEIGHT/2, "You Win!!", BLACKID);
    waitForVBlank();
    flipPage();
    state = WIN;
}
void goToLose() {
    fillScreen4(REDID);
    drawString4(SCREENWIDTH/2 - 35, SCREENHEIGHT/2, "You Lose :(", BLACKID);
    waitForVBlank();
    flipPage();
    state = LOSE;
}
void goToGame() {
    state = GAME;
    waitForVBlank();
    flipPage();
}
void Start() {
    seed++;
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(seed);
        initGame();
        goToGame();
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToPause();
    }
}
void Pause() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    } else if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
}
void Game() {
    updateGame();
    drawGame();
    sprintf(buffer, "Score: %d", score);
    drawString4(15, 145, buffer, GRAYID);
    waitForVBlank();
    flipPage();
    if (playerRemaining == 0) {
        goToLose();
    }
    if (ballsRemaining == 0) {
        goToWin();
    }
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
}
void Win() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}
void Lose() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}
