Boo Inspector - Quick User Guide
Freakow

Original idea and Code: Sandro Bihaiko
Code Assistance: Rodrigo Bamboo de Oliveira
Early editors and Docs: Breno Azevedo

1. What's Boo Inspector

Unity custom editors are extremely powerful. They basically allow you to create an entirely new interface for your component(s), and even add custom GUI elements to the Unity editor itself. According to Unity, Unity built-in components were created using the same API that's available to the end developers.

One of the main problems with developing a custom Editor Inspector for a Unity component is exactly with the notation and syntax it uses. Key commands are spread across two different libraries, and the order of the arguments is inconsistent between them - and among the commands themselves. The usage of block delimiters like "BeginHorizontal" and "EndHorizontal" also make legibility and debugging difficult.

Boo Inspector aims to improve the coding of these editor inspectors by an order of magnitude. Through the use of the powerful Boo Macros, whole new "commands" are defined, allowing the developer to easily build and customize his user interface. This is made even easier with the modern indent-encapsulation format used by boo, where components and visual elements that should belong to the same region can be grouped by simply nesting them in the same indentation alignment.

2. Install

To install Boo Inspector, simply import the package to your project. Please notice that the "Editor" folder can't be moved out of the root folder, or else your project won't compile properly.

3. How to use

Please check the folder BooInspector-Samples, there's a folder with a demo Unity scene (sample.unity) which has the functionality-stripped Editors for another Freakow product, RageTools. After opening the scene, simply select the "Ragetools GUIs Sample" game object to see all the sample custom component editors in action. Checking the editors code to learn how each GUI element was placed will get you up and running real fast. All the editors are in the folder BooInspector-Samples/RageTools/Editor. 
In any case, there are a couple things that are worth clarifying. I'll use RageCanvasAlignEditor.boo as an example, so please open it up and follow along:

[CustomEditor(typeof(RageCanvasAlign))]
	- This line points to the actual class (component) you're creating an editor for. The class itself can be written in JavaScript or C# as well. Please notice that in the code body you have to repeat the class type, like so: <Align = target as RageCanvasAlign>
	From there on you simply access the class variables with something like <Align.HorizontalAlign>.
	
public class RageCanvasAlignEditor (RageToolsEditor):
	- In this line you define another file which this editor inherits from, in this case "RageToolsEditor", which *has* to be in the root "Editor" folder. This way you can define any common behavior in a single class instead of repeating code. This specific one is responsible for the "header line" of the editor, which displays an icon resource. Like any Unity resource, that image has to be in any folder named "resources" within your project. In the demo project, this icon itself is located at BooInspector-Samples\Ragetools\Editor\Resources 

4. Code formatting

Many functions that by default have a verbose, encryptic notation can be called with a single line using Boo Inspector. For instance:

	EasyPopup "Horiz.", cAlign.HorizontalAlign

..automatically creates a dropdown pop up based on the enum used by the HorizontalAlign variable type. All "Easy" commands use the same parameter order, first it's the label (title) then the variable itself, then up to three GUILayout options (like maxwidth), always comma-separated. Being Boo means no ";" or similar end-of-line delimiter is needed, simply hit return and you're done.

5. Rows and Columns

This doesn't need much explanation, there's no "Begin Horizontal" or "End Horizontal" needed to encapsulate your lines, for instance. Supposing you want a new row, type "EasyRow" (without the quotes), add a colon to the end, hit return and tab. Make sure your editor isn't replacing tabs with spaces - Visual Studio does it by default, Mono Develop doesn't. Everything tab-aligned to that same tab stop will be arranged in the same row, automatically. For Example:

		EasyRow:
			EasyToggle "Group Tweak", _rageGroup.GroupTweak, MaxWidth(100f) 
			EasyToggle "Proportional", _rageGroup.Proportional, MaxWidth(90f)

Will add two "boolean toggles" right next to each other, in the same line. Use the same logic for EasyCol (for columns, always following the CSS approach), and check the other editors for more examples of how to use the other commands. There's even an "EasySettings" so you can automatically group your advanced settings in a collapsable foldout, improving the component's usability and accessibility. 

All available commands can be checked in the EasyMacros.boo file, located in Editor\BooInspector

6. Support

Being a free, open source component (and it'll stay like this!) we can't promise a super-fast support to Boo Inspector, but we'll do our best to reply any e-mail related to it. Send an e-mail to contact@freakow.com and please make sure your subject has "Boo Inspector" in it. By the way, if you add some helpful new "easy" commands to Boo Inspector and want to share the grace with the world, we'd love to add your code and credits in future versions. Also please check the project's wiki (https://github.com/bihaiko/BooInspector/wiki/) to read some additional information and background info, in the "History of a Class" entry.

7. Conclusion

We hope you find Boo Inspector as useful as we do, please spread the word and help to alleviate the pains of Unity component developers around the world that want to improve their editors. Enjoy!