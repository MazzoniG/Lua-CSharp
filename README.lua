Lua-CSharp
==========

This project is an integration between Lua and C#.

--Another way of print and assign values to a Variable
luanet.load_assembly "System"

Console = luanet.import_type "System.Console"
Math = luanet.import_type "System.Math"

Console.WriteLine("sqrt(2) is {0}",Math.Sqrt(2))



--Lua Generating a Form
luanet.load_assembly "System.Windows.Forms"
Form = luanet.import_type "System.Windows.Forms.Form"

form = Form()
form.Text = "Generated Form"
form:ShowDialog()



--Generate a form with Events
luanet.load_assembly "System.Windows.Forms"
luanet.load_assembly "System.Drawing"

Form = luanet.import_type "System.Windows.Forms.Form"
Button = luanet.import_type "System.Windows.Forms.Button"
TextBox = luanet.import_type "System.Windows.Forms.TextBox"
RadioButton = luanet.import_type "System.Windows.Forms.RadioButton"
Size = luanet.import_type "System.Drawing.Size"
Point = luanet.import_type "System.Drawing.Point"

form = Form()
form.Text = "Generated Form"

button = Button()
button.Text = "Print"
button.Click:Add(function()
    print(textbox.Text)
end)
button.Location = Point(100,110)
form.Controls:Add(button)

textbox = TextBox()
textbox.Size = Size(150,0)
textbox.Location = Point(65,90)
form.Controls:Add(textbox)


Bold = RadioButton()
Bold.Text = "Bold"
Bold.Name = "Bold"
Bold.Location = Point(70,50)
Bold.CheckedChanged:Add(function()
    radio(Bold, textbox)
end)

form.Controls:Add(Bold)

Italic = RadioButton()
Italic.Text = "Italic"
Italic.Name = "Italic"
Italic.Location = Point(175,50)
Italic.CheckedChanged:Add(function()
    radio(Italic, textbox)
end)

form.Controls:Add(Italic)

form:ShowDialog()

