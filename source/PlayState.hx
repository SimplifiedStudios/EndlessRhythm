package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxSpriteGroup;
import flixel.input.keyboard.FlxKey;
import flixel.math.FlxRandom;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var Note:FlxSprite;
	var Note1:FlxSprite;
	var Note2:FlxSprite;
	var Note3:FlxSprite;

	var NoteGroup:FlxSpriteGroup;

	var noteProb = 15;
	var yAxisGlobal = 800;

	override public function create()
	{
		Note = new FlxSprite();
		Note.makeGraphic(50, 50, FlxColor.WHITE);
		Note.screenCenter(X);
		Note.y = yAxisGlobal;
		Note.x -= 200;
		add(Note);

		Note1 = new FlxSprite();
		Note1.makeGraphic(50, 50, FlxColor.WHITE);
		Note1.screenCenter(X);
		Note1.y = yAxisGlobal;
		Note1.x -= 100;
		add(Note1);

		Note2 = new FlxSprite();
		Note2.makeGraphic(50, 50, FlxColor.WHITE);
		Note2.screenCenter(X);
		Note2.y = yAxisGlobal;
		Note2.x += 100;
		add(Note2);

		Note3 = new FlxSprite();
		Note3.makeGraphic(50, 50, FlxColor.WHITE);
		Note3.screenCenter(X);
		Note3.y = yAxisGlobal;
		Note3.x += 200;
		add(Note3);

		NoteGroup = new FlxSpriteGroup();

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		manageKeybinds();
		endlessNotes();
	}

	public function noteOneCollide(i:FlxSprite, strumNote:FlxSprite)
	{
		if (i.ID == 0)
		{
			if (FlxG.keys.anyPressed([FlxKey.D]))
			{
				i.destroy();
			}
		}

		if (i.ID == 1)
		{
			if (FlxG.keys.anyPressed([FlxKey.F]))
			{
				i.destroy();
			}
		}

		if (i.ID == 2)
		{
			if (FlxG.keys.anyPressed([FlxKey.J]))
			{
				i.destroy();
			}
		}

		if (i.ID == 3)
		{
			if (FlxG.keys.anyPressed([FlxKey.K]))
			{
				i.destroy();
			}
		}
	}

	public function endlessNotes()
	{
		for (i in NoteGroup)
		{
			i.y += 10;
			FlxG.overlap(i, Note, noteOneCollide);
			FlxG.overlap(i, Note1, noteOneCollide);
			FlxG.overlap(i, Note2, noteOneCollide);
			FlxG.overlap(i, Note3, noteOneCollide);
			if (i.y >= 900)
			{
				i.destroy();
			}
		}

		var randomGeneration = FlxG.random.int(0, noteProb);
		if (randomGeneration == 1)
		{
			var randomInt = FlxG.random.int(0, 3);
			trace(randomInt);
			if (randomInt == 0)
			{
				var RandomNote = new FlxSprite();
				RandomNote.makeGraphic(50, 50, FlxColor.WHITE);
				RandomNote.screenCenter(X);
				RandomNote.ID = 0;
				RandomNote.x -= 200;
				add(RandomNote);
				NoteGroup.add(RandomNote);
			}

			if (randomInt == 1)
			{
				var RandomNote = new FlxSprite();
				RandomNote.makeGraphic(50, 50, FlxColor.WHITE);
				RandomNote.screenCenter(X);
				RandomNote.ID = 1;
				RandomNote.x -= 100;
				add(RandomNote);
				NoteGroup.add(RandomNote);
			}

			if (randomInt == 2)
			{
				var RandomNote = new FlxSprite();
				RandomNote.makeGraphic(50, 50, FlxColor.WHITE);
				RandomNote.screenCenter(X);
				RandomNote.ID = 2;
				RandomNote.x += 100;
				add(RandomNote);
				NoteGroup.add(RandomNote);
			}

			if (randomInt == 3)
			{
				var RandomNote = new FlxSprite();
				RandomNote.makeGraphic(50, 50, FlxColor.WHITE);
				RandomNote.screenCenter(X);
				RandomNote.ID = 3;
				RandomNote.x += 200;
				add(RandomNote);
				NoteGroup.add(RandomNote);
			}
		}
	}

	public function manageKeybinds()
	{
		if (FlxG.keys.anyPressed([FlxKey.D]))
		{
			Note.color = FlxColor.RED;
		}
		else
		{
			Note.color = FlxColor.WHITE;
		}

		if (FlxG.keys.anyPressed([FlxKey.F]))
		{
			Note1.color = FlxColor.RED;
		}
		else
		{
			Note1.color = FlxColor.WHITE;
		}

		if (FlxG.keys.anyPressed([FlxKey.J]))
		{
			Note2.color = FlxColor.RED;
		}
		else
		{
			Note2.color = FlxColor.WHITE;
		}

		if (FlxG.keys.anyPressed([FlxKey.K]))
		{
			Note3.color = FlxColor.RED;
		}
		else
		{
			Note3.color = FlxColor.WHITE;
		}
	}
}
