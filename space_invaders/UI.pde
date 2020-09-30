class UserInterface{
	PFont fontLarge;
	PFont fontSmall;
	PFont fontTitle;

	color colMainBG = color(0,0,0,255);
	color colGameOverBG = color(0,0,0,255);
	color colTextDefault = color(255,255,255,255);
	color colTextScore = color(0,202,0,255);
	color colTextHiScore = color(255,230,0,255);
	float timeSinceDeath = 0.0;
	boolean newHiScore = true;

	UserInterface(){
		fontLarge = loadFont("LargeText-24.vlw");
		fontSmall = loadFont("SmallText-12.vlw");
		fontTitle = loadFont("Title-72.vlw");
	}

	void drawTitle(){
		background(colMainBG);

		//Title text
		fill(colTextDefault);
		textAlign(CENTER, CENTER);
		textFont(fontTitle, 72);
		text("SPÄJS INVÄDORS", width * 0.5, 375);
		stroke(colTextDefault);
		strokeWeight(4);
		line(0, height * 0.5, 120, height * 0.5);
		line(150, height * 0.5, 190, height * 0.5);
		line(220, height * 0.5, width, height * 0.5);

		//Sub text
		textFont(fontLarge, 24);
		float animV = sin(millis() * 0.01) +1;
		color animHiS = lerpColor(colTextHiScore, color (255,255,255,255), animV * 0.5);
		fill(animHiS);
		text("PRESS ANY KEY", width * 0.5, height * 0.6 + 20);
		textFont(fontSmall, 12);
		text("Coins : 3", width * 0.5, height * 0.6);
	}

	void drawHUD(){
		if(score < highScore){
			newHiScore = false;
			fill(colTextScore);
			textFont(fontSmall, 12);
			textAlign(LEFT, TOP);
			text("Score : " + score, 10, 10);
			textFont(fontLarge, 24);
			textAlign(CENTER, TOP);
			text("HiScore : " + highScore, width * 0.5, 30);
		}else{
			newHiScore = true;
			fill(colTextScore);
			textFont(fontSmall, 12);
			textAlign(LEFT, TOP);
			text("OldHiScore : " + highScore, 10, 10);

			float animV = sin(millis() * 0.01) +1;
			color animHiS = lerpColor(colTextHiScore, color (255,255,255,255), animV * 0.5);

			fill(animHiS);
			textFont(fontLarge, 24);
			textAlign(CENTER, TOP);
			text("NewHiScore : " + score, width * 0.5, 30);
		}
	}

	public void drawGameOver() {
//TODO: reset timeSinceDeath on new Game.
//TODO: state		
		timeSinceDeath += clock.deltaTime();
		color fade = lerpColor(color(0,0,0,0), colMainBG, timeSinceDeath * 0.1);


		fill(fade);
		rect(0,0,width,height);

		fill(colTextDefault);
		textAlign(CENTER, CENTER);
		textFont(fontLarge, 24);
		text("Game Over", width / 2, height / 2);
		textFont(fontSmall, 12);

		if(newHiScore){
			text("Your new HiScore", width * 0.5, height * 0.6);
			textFont(fontLarge, 24);
			float animV = sin(millis() * 0.01) +1;
			color animHiS = lerpColor(colTextHiScore, color (255,255,255,255), animV * 0.5);
			fill(animHiS);
			text(score, width * 0.5, height * 0.6 + 20);
		}else{
			text("Your score", width * 0.5, height * 0.6);
			textFont(fontLarge, 24);
			float animV = sin(millis() * 0.01) +1;
			color animHiS = lerpColor(colTextHiScore, color (255,255,255,255), animV * 0.5);
			fill(animHiS);
			text(score, width * 0.5, height * 0.6 + 20);
		}
	}

	void drawCredits(){
		//TODO: This
		// Set the stroke color by hue.
	/*
	
	*/
	}

/*
	color hueColor(float hue) {
		colorMode(HSB, 1);
		stroke(hue % 1, 1, 1);
		colorMode(RGB);
	}
*/

	void reset(){
		timeSinceDeath = 0;
		newHiScore = false;
	}
}