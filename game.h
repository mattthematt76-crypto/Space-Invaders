typedef struct {
    int row;
	int col;
	int oldRow;
	int oldCol;
	int cdel;
    int rdel;
	int height;
	int width;
    int size;
	unsigned char color;
    int bulletTimer;
} PLAYER;

typedef struct {
    int row;
	int col;
	int height;
	int width;
    int size;
	unsigned char color;
    int health;
	int active;
} BARRIER;

typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int rdel;
	int cdel;
	int height;
	int width;
	unsigned char color;
	int active;
	int erased;
	int count;
	int bulletTimer;
	int arrayrow;
} BALL;

typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int rdel;
	int height;
	int width;
	int cdel;
	unsigned char color;
	int active;
	int erased;
    int direction;
} BULLET;

#define NUMCOLORS 6
//This does an enum trick to make them the last indeces of the palette
enum {BLACKID=(256-NUMCOLORS), REDID, GREENID, BLUEID, WHITEID, GRAYID};
extern unsigned short colors[NUMCOLORS];

#define BULLETCOUNT 5
#define BALLCOUNT 15
#define BARRIERCOUNT 3
extern PLAYER player;
extern BULLET bullets[BULLETCOUNT];
extern BALL balls[BALLCOUNT];
extern BARRIER barriers[BARRIERCOUNT];
extern int ballsRemaining;
extern int playerRemaining;
extern int score;

// Prototypes
void initGame();
void updateGame();
void drawGame();

void initCannon();
void updateCannon();
void drawCannon();

void initBullets();
void firePlayerBullet();
void updateBullet(BULLET *);
void drawBullet(BULLET *);
void initBalls();
void updateBall(BALL *);
void drawBall(BALL *);
void switchDirection(BALL *);
