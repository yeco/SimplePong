package{
    import flash.display.MovieClip;
    import flash.display.Stage;
    import flash.display.StageQuality;
	import flash.display.Sprite;
    
    public class SimplePong extends MovieClip

{
    public var velocity = {x:-10,y:10};
    public var player1 = new Sprite();
    public var player2 = new Sprite();
    public var ball = new Sprite();
    
    public function SimplePong()
    {
        stage.align = "TL";
        stage.scaleMode = "noScale";

        addChild(player1);
        addChild(player2);

        addChild(ball);

        // drawing the squares
        draw ( player1, 40, 80);
        draw ( player2, 40, 80);
        draw ( ball, 20, 20);

        addEventListener("enterFrame",loop);
        
        
    }
    // magic loop
    private function loop(e)
    {
    	ball.x += velocity.x;
    	ball.y += velocity.y;

    	player2.x = stage.stageWidth;

    	player1.y = mouseY;
    	player2.y = stage.stageHeight - mouseY;

    	if (ball.y < 10 || ball.y > stage.stageHeight - 10)
    		velocity.y = -velocity.y;

    	if ( ( ball.hitTestObject(player1) && ball.x > 20 ) || ( ball.hitTestObject(player2) && ball.x < stage.stageWidth - 20 ) )
    		velocity.x = -velocity.x;

    	if (ball.x < -10 || ball.x > stage.stageWidth + 10)
    	{
    		ball.x = stage.stageWidth * .5;
    		ball.y = stage.stageHeight * .5;
    		velocity.x = -velocity.x;
    	}
    }

    // square drawing function
    private function draw(t,w,h)
    {
    	t.graphics.beginFill( 0xFFFFFF, 1 );
    	t.graphics.drawRect( -w*.5, -h*.5, w, h );
    	t.graphics.endFill();
    }

}

}
