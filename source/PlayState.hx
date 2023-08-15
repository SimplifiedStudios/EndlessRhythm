package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.input.keyboard.FlxKey;
import flixel.math.FlxRandom;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var Note:FlxSprite;
	var Note1:FlxSprite;
	var Note2:FlxSprite;
	var Note3:FlxSprite;

	var Notes = [];

	var score = 0;

	public override function create()
	{
		Note = new FlxSprite();
		Note.makeGraphic(50, 50, FlxColor.WHITE);
		Note.screenCenter(X);
		Note.y = 700;
		Note.x -= 400;
		add(Note);

		Note1 = new FlxSprite();
		Note1.makeGraphic(50, 50, FlxColor.WHITE);
		Note1.screenCenter(X);
		Note1.y = 700;
		Note1.x -= 300;
		add(Note1);

		Note2 = new FlxSprite();
		Note2.makeGraphic(50, 50, FlxColor.WHITE);
		Note2.screenCenter(X);
		Note2.y = 700;
		Note2.x -= 200;
		add(Note2);

		Note3 = new FlxSprite();
		Note3.makeGraphic(50, 50, FlxColor.WHITE);
		Note3.screenCenter(X);
		Note3.y = 700;
		Note3.x -= 100;
		add(Note3);
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		keyPresser();
		noteSpawner();
	}

	public function HitTheNote(Obj1:FlxSprite, Obj2:FlxSprite)
	{
		Sys.sleep(0.005);

		switch Obj1.ID
		{
			case 401:
				{
					if (FlxG.keys.anyPressed([FlxKey.D]))
					{
						Obj1.destroy();
						score++;
					}
				}
			case 402:
				{
					if (FlxG.keys.anyPressed([FlxKey.F]))
					{
						Obj1.destroy();
						score++;
					}
				}
			case 403:
				{
					if (FlxG.keys.anyPressed([FlxKey.J]))
					{
						Obj1.destroy();
						score++;
					}
				}
			case 404:
				{
					if (FlxG.keys.anyPressed([FlxKey.K]))
					{
						Obj1.destroy();
						score++;
					}
				}
		}
	}

	public function noteSpawner()
	{
		if (FlxG.random.float(0.1, 1.0) >= 0.9)
		{
			var randInt = FlxG.random.int(1, 4);

			if (randInt == 1)
			{
				var GayNote = new FlxSprite();
				GayNote.makeGraphic(40, 40, FlxColor.WHITE);
				GayNote.screenCenter(X);
				GayNote.y = 0;
				GayNote.x -= 100;
				add(GayNote);

				GayNote.ID = 401;
				FlxG.collide(GayNote, Note, HitTheNote);

				Notes.push(GayNote);
			}
			else if (randInt == 2)
			{
				var GayNote = new FlxSprite();
				GayNote.makeGraphic(20, 20, FlxColor.WHITE);
				GayNote.screenCenter(X);
				GayNote.y = 0;
				GayNote.x -= 200;
				add(GayNote);

				GayNote.ID = 402;
				FlxG.collide(GayNote, Note, HitTheNote);

				Notes.push(GayNote);
			}
			else if (randInt == 3)
			{
				var GayNote = new FlxSprite();
				GayNote.makeGraphic(20, 20, FlxColor.WHITE);
				GayNote.screenCenter(X);
				GayNote.y = 0;
				GayNote.x -= 300;
				add(GayNote);

				GayNote.ID = 403;
				FlxG.collide(GayNote, Note, HitTheNote);

				Notes.push(GayNote);
			}
			else if (randInt == 4)
			{
				var GayNote = new FlxSprite();
				GayNote.makeGraphic(20, 20, FlxColor.WHITE);
				GayNote.screenCenter(X);
				GayNote.y = 0;
				GayNote.x -= 400;
				add(GayNote);

				GayNote.ID = 404;
				FlxG.collide(GayNote, Note, HitTheNote);

				Notes.push(GayNote);
			}

			for (k in Notes)
			{
				k.y += 5;

				if (k.y == 700)
					HitTheNote(k, Note);
			}
		}
	}

	public function keyPresser()
	{
		if (FlxG.keys.anyPressed([FlxKey.D]))
		{
			Note.color = FlxColor.PINK;
		}
		else
		{
			Note.color = FlxColor.GRAY;
		}

		if (FlxG.keys.anyPressed([FlxKey.F]))
		{
			Note1.color = FlxColor.BLUE;
		}
		else
		{
			Note1.color = FlxColor.GRAY;
		}

		if (FlxG.keys.anyPressed([FlxKey.J]))
		{
			Note2.color = FlxColor.GREEN;
		}
		else
		{
			Note2.color = FlxColor.GRAY;
		}

		if (FlxG.keys.anyPressed([FlxKey.K]))
		{
			Note3.color = FlxColor.RED;
		}
		else
		{
			Note3.color = FlxColor.GRAY;
		}
	}
}
