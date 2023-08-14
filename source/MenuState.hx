package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import lime.system.System;
import openfl.display.Application;

class MenuState extends FlxState
{
	var options:Array<MenuOption>;
	var selectedOption:Int = 0;

	override public function create():Void
	{
		options = [
			new MenuOption("Play", MenuState),
			new MenuOption("Options", MenuState),
			new MenuOption("Exit", null)
		];

		var yOffset:Float = 100;
		for (option in options)
		{
			var text:FlxText = new FlxText(0, 0, FlxG.width, option.label);
			text.size = 24;
			text.alignment = "center";
			text.y = yOffset;
			add(text);

			option.text = text;
			yOffset += 40;
		}

		updateSelectedOptionVisual();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		// Menu navigation with keyboard or mouse
		if (FlxG.keys.justPressed.DOWN)
		{
			selectedOption = (selectedOption + 1) % options.length;
			updateSelectedOptionVisual();
		}
		else if (FlxG.keys.justPressed.UP)
		{
			selectedOption = (selectedOption - 1 + options.length) % options.length;
			updateSelectedOptionVisual();
		}
		else if (FlxG.keys.justPressed.ENTER)
		{
			selectOption();
		}
	}

	function updateSelectedOptionVisual():Void
	{
		for (i in 0...options.length)
		{
			options[i].text.color = (i == selectedOption) ? 0xFFFF00 : 0xFFFFFF;
		}
	}

	function selectOption():Void
	{
		var selected:MenuOption = options[selectedOption];
		switch selectedOption
		{
			case 0:
				FlxG.switchState(new PlayState());
			case 1:
				trace("Options not finished");
			case 2:
				System.exit(0);
		}
	}
}

class MenuOption
{
	public var label:String;
	public var state:Class<FlxState>;
	public var text:FlxText;

	public function new(label:String, state:Class<FlxState>)
	{
		this.label = label;
		this.state = state;
	}
}
