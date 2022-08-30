local Config = {
	WindowName = "daerty 2.1",
	Color = Color3.fromRGB(182, 41, 243),
	Keybind = Enum.KeyCode.LeftAlt
}
-- local Library = {Toggle = true,FirstTab = nil,TabCount = 0,ColorTable = {}}

-- local RunService = game:GetService("RunService")
-- local HttpService = game:GetService("HttpService")
-- local TweenService = game:GetService("TweenService")
-- local UserInputService = game:GetService("UserInputService")

-- local function MakeDraggable(ClickObject, Object)
-- local Dragging = nil
-- local DragInput = nil
-- local DragStart = nil
-- local StartPosition = nil

-- ClickObject.InputBegan:Connect(function(Input)
-- if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
-- Dragging = true
-- DragStart = Input.Position
-- StartPosition = Object.Position

-- Input.Changed:Connect(function()
-- if Input.UserInputState == Enum.UserInputState.End then
-- Dragging = false
-- end
-- end)
-- end
-- end)

-- ClickObject.InputChanged:Connect(function(Input)
-- if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
-- DragInput = Input
-- end
-- end)

-- UserInputService.InputChanged:Connect(function(Input)
-- if Input == DragInput and Dragging then
-- local Delta = Input.Position - DragStart
-- Object.Position = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y)
-- end
-- end)
-- end

-- function Library:CreateWindow(Config, Parent)
-- local WindowInit = {}
-- local Folder = game:GetObjects("rbxassetid://7141683860")[1]
-- local Screen = Folder.Bracket:Clone()
-- local Main = Screen.Main
-- local Holder = Main.Holder
-- local Topbar = Main.Topbar
-- local TContainer = Holder.TContainer
-- local TBContainer = Holder.TBContainer.Holder
-- --[[
-- -- idk probably fix for exploits that dont have this function
-- if syn and syn.protect_gui then
-- syn.protect_gui(Screen)
-- end
-- ]]

-- Screen.Name =  HttpService:GenerateGUID(false)
-- Screen.Parent = Parent
-- Topbar.WindowName.Text = Config.WindowName

-- MakeDraggable(Topbar,Main)
-- local function CloseAll()
-- for _,Tab in pairs(TContainer:GetChildren()) do
-- if Tab:IsA("ScrollingFrame") then
-- Tab.Visible = false
-- end
-- end
-- end
-- local function ResetAll()
-- for _,TabButton in pairs(TBContainer:GetChildren()) do
-- if TabButton:IsA("TextButton") then
-- TabButton.BackgroundTransparency = 1
-- end
-- end
-- for _,TabButton in pairs(TBContainer:GetChildren()) do
-- if TabButton:IsA("TextButton") then
-- TabButton.Size = UDim2.new(0,480 / Library.TabCount,1,0)
-- end
-- end
-- for _,Pallete in pairs(Screen:GetChildren()) do
-- if Pallete:IsA("Frame") and Pallete.Name ~= "Main" then
-- Pallete.Visible = false
-- end
-- end
-- end
-- local function KeepFirst()
-- for _,Tab in pairs(TContainer:GetChildren()) do
-- if Tab:IsA("ScrollingFrame") then
-- if Tab.Name == Library.FirstTab .. " T" then
-- Tab.Visible = true
-- else
-- Tab.Visible = false
-- end
-- end
-- end
-- for _,TabButton in pairs(TBContainer:GetChildren()) do
-- if TabButton:IsA("TextButton") then
-- if TabButton.Name == Library.FirstTab .. " TB" then
-- TabButton.BackgroundTransparency = 0
-- else
-- TabButton.BackgroundTransparency = 1
-- end
-- end
-- end
-- end
-- local function Toggle(State)
-- if State then
-- Main.Visible = true
-- elseif not State then
-- for _,Pallete in pairs(Screen:GetChildren()) do
-- if Pallete:IsA("Frame") and Pallete.Name ~= "Main" then
-- Pallete.Visible = false
-- end
-- end
-- Screen.ToolTip.Visible = false
-- Main.Visible = false
-- end
-- Library.Toggle = State
-- end
-- local function ChangeColor(Color)
-- Config.Color = Color
-- for i, v in pairs(Library.ColorTable) do
-- if v.BackgroundColor3 ~= Color3.fromRGB(50, 50, 50) then
-- v.BackgroundColor3 = Color
-- end
-- end
-- end

-- function WindowInit:Toggle(State)
-- Toggle(State)
-- end

-- function WindowInit:ChangeColor(Color)
-- ChangeColor(Color)
-- end

-- function WindowInit:SetBackground(ImageId)
-- Holder.Image = "rbxassetid://" .. ImageId
-- end

-- function WindowInit:SetBackgroundColor(Color)
-- Holder.ImageColor3 = Color
-- end
-- function WindowInit:SetBackgroundTransparency(Transparency)
-- Holder.ImageTransparency = Transparency
-- end

-- function WindowInit:SetTileOffset(Offset)
-- Holder.TileSize = UDim2.new(0,Offset,0,Offset)
-- end
-- function WindowInit:SetTileScale(Scale)
-- Holder.TileSize = UDim2.new(Scale,0,Scale,0)
-- end

-- RunService.RenderStepped:Connect(function()
-- if Library.Toggle then
-- Screen.ToolTip.Position = UDim2.new(0,UserInputService:GetMouseLocation().X + 10,0,UserInputService:GetMouseLocation().Y - 5)
-- end
-- end)

-- function WindowInit:CreateTab(Name)
-- local TabInit = {}
-- local Tab = Folder.Tab:Clone()
-- local TabButton = Folder.TabButton:Clone()

-- Tab.Name = Name .. " T"
-- Tab.Parent = TContainer

-- TabButton.Name = Name .. " TB"
-- TabButton.Parent = TBContainer
-- TabButton.Title.Text = Name
-- TabButton.BackgroundColor3 = Config.Color

-- table.insert(Library.ColorTable, TabButton)
-- Library.TabCount = Library.TabCount + 1
-- if Library.TabCount == 1 then
-- Library.FirstTab = Name
-- end

-- CloseAll()
-- ResetAll()
-- KeepFirst()

-- local function GetSide(Longest)
-- if Longest then
-- if Tab.LeftSide.ListLayout.AbsoluteContentSize.Y > Tab.RightSide.ListLayout.AbsoluteContentSize.Y then
-- return Tab.LeftSide
-- else
-- return Tab.RightSide
-- end
-- else
-- if Tab.LeftSide.ListLayout.AbsoluteContentSize.Y > Tab.RightSide.ListLayout.AbsoluteContentSize.Y then
-- return Tab.RightSide
-- else
-- return Tab.LeftSide
-- end
-- end
-- end

-- TabButton.MouseButton1Click:Connect(function()
-- CloseAll()
-- ResetAll()
-- Tab.Visible = true
-- TabButton.BackgroundTransparency = 0
-- end)

-- Tab.LeftSide.ListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
-- if GetSide(true).Name == Tab.LeftSide.Name then
-- Tab.CanvasSize = UDim2.new(0,0,0,Tab.LeftSide.ListLayout.AbsoluteContentSize.Y + 15)
-- else
-- Tab.CanvasSize = UDim2.new(0,0,0,Tab.RightSide.ListLayout.AbsoluteContentSize.Y + 15)
-- end
-- end)
-- Tab.RightSide.ListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
-- if GetSide(true).Name == Tab.LeftSide.Name then
-- Tab.CanvasSize = UDim2.new(0,0,0,Tab.LeftSide.ListLayout.AbsoluteContentSize.Y + 15)
-- else
-- Tab.CanvasSize = UDim2.new(0,0,0,Tab.RightSide.ListLayout.AbsoluteContentSize.Y + 15)
-- end
-- end)

-- function TabInit:CreateSection(Name)
-- local SectionInit = {}
-- local Section = Folder.Section:Clone()
-- Section.Name = Name .. " S"
-- Section.Parent = GetSide(false)

-- Section.Title.Text = Name
-- Section.Title.Size = UDim2.new(0,Section.Title.TextBounds.X + 10,0,2)

-- Section.Container.ListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
-- Section.Size = UDim2.new(1,0,0,Section.Container.ListLayout.AbsoluteContentSize.Y + 15)
-- end)

-- function SectionInit:CreateLabel(Name)
-- local LabelInit = {}
-- local Label = Folder.Label:Clone()
-- Label.Name = Name .. " L"
-- Label.Parent = Section.Container
-- Label.Text = Name
-- Label.Size = UDim2.new(1,-10,0,Label.TextBounds.Y)
-- function LabelInit:UpdateText(Text)
-- Label.Text = Text
-- Label.Size = UDim2.new(1,-10,0,Label.TextBounds.Y)
-- end
-- return LabelInit
-- end
-- function SectionInit:CreateButton(Name, Callback)
-- local ButtonInit = {}
-- local Button = Folder.Button:Clone()
-- Button.Name = Name .. " B"
-- Button.Parent = Section.Container
-- Button.Title.Text = Name
-- Button.Size = UDim2.new(1,-10,0,Button.Title.TextBounds.Y + 5)
-- table.insert(Library.ColorTable, Button)

-- Button.MouseButton1Down:Connect(function()
-- Button.BackgroundColor3 = Config.Color
-- end)

-- Button.MouseButton1Up:Connect(function()
-- Button.BackgroundColor3 = Color3.fromRGB(50,50,50)
-- end)

-- Button.MouseLeave:Connect(function()
-- Button.BackgroundColor3 = Color3.fromRGB(50,50,50)
-- end)

-- Button.MouseButton1Click:Connect(function()
-- Callback()
-- end)

-- function ButtonInit:AddToolTip(Name)
-- if tostring(Name):gsub(" ", "") ~= "" then
-- Button.MouseEnter:Connect(function()
-- Screen.ToolTip.Text = Name
-- Screen.ToolTip.Size = UDim2.new(0,Screen.ToolTip.TextBounds.X + 5,0,Screen.ToolTip.TextBounds.Y + 5)
-- Screen.ToolTip.Visible = true
-- end)

-- Button.MouseLeave:Connect(function()
-- Screen.ToolTip.Visible = false
-- end)
-- end
-- end

-- return ButtonInit
-- end
-- function SectionInit:CreateTextBox(Name, PlaceHolder, NumbersOnly, Callback)
-- local TextBoxInit = {}
-- local TextBox = Folder.TextBox:Clone()
-- TextBox.Name = Name .. " T"
-- TextBox.Parent = Section.Container
-- TextBox.Title.Text = Name
-- TextBox.Background.Input.PlaceholderText = PlaceHolder
-- TextBox.Title.Size = UDim2.new(1,0,0,TextBox.Title.TextBounds.Y + 5)
-- TextBox.Size = UDim2.new(1,-10,0,TextBox.Title.TextBounds.Y + 25)

-- TextBox.Background.Input.FocusLost:Connect(function()
-- if NumbersOnly and not tonumber(TextBox.Background.Input.Text) then
-- Callback(tonumber(TextBox.Background.Input.Text))
-- --TextBox.Background.Input.Text = ""
-- else
-- Callback(TextBox.Background.Input.Text)
-- --TextBox.Background.Input.Text = ""
-- end
-- end)
-- function TextBoxInit:SetValue(String)
-- Callback(String)
-- TextBox.Background.Input.Text = String
-- end
-- function TextBoxInit:AddToolTip(Name)
-- if tostring(Name):gsub(" ", "") ~= "" then
-- TextBox.MouseEnter:Connect(function()
-- Screen.ToolTip.Text = Name
-- Screen.ToolTip.Size = UDim2.new(0,Screen.ToolTip.TextBounds.X + 5,0,Screen.ToolTip.TextBounds.Y + 5)
-- Screen.ToolTip.Visible = true
-- end)

-- TextBox.MouseLeave:Connect(function()
-- Screen.ToolTip.Visible = false
-- end)
-- end
-- end
-- return TextBoxInit
-- end
-- function SectionInit:CreateToggle(Name, Default, Callback)
-- local DefaultLocal = Default or false
-- local ToggleInit = {}
-- local Toggle = Folder.Toggle:Clone()
-- Toggle.Name = Name .. " T"
-- Toggle.Parent = Section.Container
-- Toggle.Title.Text = Name
-- Toggle.Size = UDim2.new(1,-10,0,Toggle.Title.TextBounds.Y + 5)

-- table.insert(Library.ColorTable, Toggle.Toggle)
-- local ToggleState = false

-- local function SetState(State)
-- if State then
-- Toggle.Toggle.BackgroundColor3 = Config.Color
-- elseif not State then
-- Toggle.Toggle.BackgroundColor3 = Color3.fromRGB(50,50,50)
-- end
-- ToggleState = State
-- Callback(State)
-- end

-- Toggle.MouseButton1Click:Connect(function()
-- ToggleState = not ToggleState
-- SetState(ToggleState)
-- end)

-- function ToggleInit:AddToolTip(Name)
-- if tostring(Name):gsub(" ", "") ~= "" then
-- Toggle.MouseEnter:Connect(function()
-- Screen.ToolTip.Text = Name
-- Screen.ToolTip.Size = UDim2.new(0,Screen.ToolTip.TextBounds.X + 5,0,Screen.ToolTip.TextBounds.Y + 5)
-- Screen.ToolTip.Visible = true
-- end)

-- Toggle.MouseLeave:Connect(function()
-- Screen.ToolTip.Visible = false
-- end)
-- end
-- end

-- if Default == nil then
-- function ToggleInit:SetState(State)
-- SetState(State)
-- end
-- else
-- SetState(DefaultLocal)
-- end

-- function ToggleInit:GetState(State)
-- return ToggleState
-- end

-- function ToggleInit:CreateKeybind(Bind,Callback)
-- local KeybindInit = {}
-- Bind = Bind or "NONE"

-- local WaitingForBind = false
-- local Selected = Bind
-- local Blacklist = {"W","A","S","D","Slash","Tab","Backspace","Escape","Space","Delete","Unknown","Backquote"}

-- Toggle.Keybind.Visible = true
-- Toggle.Keybind.Text = "[ " .. Bind .. " ]"

-- Toggle.Keybind.MouseButton1Click:Connect(function()
-- Toggle.Keybind.Text = "[ ... ]"
-- WaitingForBind = true
-- end)

-- Toggle.Keybind:GetPropertyChangedSignal("TextBounds"):Connect(function()
-- Toggle.Keybind.Size = UDim2.new(0,Toggle.Keybind.TextBounds.X,1,0)
-- Toggle.Title.Size = UDim2.new(1,-Toggle.Keybind.Size.X.Offset - 15,1,0)
-- end)

-- UserInputService.InputBegan:Connect(function(Input)
-- if WaitingForBind and Input.UserInputType == Enum.UserInputType.Keyboard then
-- local Key = tostring(Input.KeyCode):gsub("Enum.KeyCode.", "")
-- if not table.find(Blacklist, Key) then
-- Toggle.Keybind.Text = "[ " .. Key .. " ]"
-- Selected = Key
-- else
-- Toggle.Keybind.Text = "[ NONE ]"
-- Selected = "NONE"
-- end
-- WaitingForBind = false
-- elseif Input.UserInputType == Enum.UserInputType.Keyboard then
-- local Key = tostring(Input.KeyCode):gsub("Enum.KeyCode.", "")
-- if Key == Selected then
-- ToggleState = not ToggleState
-- SetState(ToggleState)
-- if Callback then
-- Callback(Key)
-- end
-- end
-- end
-- end)

-- function KeybindInit:SetBind(Key)
-- Toggle.Keybind.Text = "[ " .. Key .. " ]"
-- Selected = Key
-- end

-- function KeybindInit:GetBind()
-- return Selected
-- end

-- return KeybindInit
-- end
-- return ToggleInit
-- end
-- function SectionInit:CreateSlider(Name, Min, Max, Default, Precise, Callback)
-- local DefaultLocal = Default or 50
-- local SliderInit = {}
-- local Slider = Folder.Slider:Clone()
-- Slider.Name = Name .. " S"
-- Slider.Parent = Section.Container

-- Slider.Title.Text = Name
-- Slider.Slider.Bar.Size = UDim2.new(Min / Max,0,1,0)
-- Slider.Slider.Bar.BackgroundColor3 = Config.Color
-- Slider.Value.PlaceholderText = tostring(Min / Max)
-- Slider.Title.Size = UDim2.new(1,0,0,Slider.Title.TextBounds.Y + 5)
-- Slider.Size = UDim2.new(1,-10,0,Slider.Title.TextBounds.Y + 15)
-- table.insert(Library.ColorTable, Slider.Slider.Bar)

-- local GlobalSliderValue = 0
-- local Dragging = false
-- local function Sliding(Input)
-- local Position = UDim2.new(math.clamp((Input.Position.X - Slider.Slider.AbsolutePosition.X) / Slider.Slider.AbsoluteSize.X,0,1),0,1,0)
-- Slider.Slider.Bar.Size = Position
-- local SliderPrecise = ((Position.X.Scale * Max) / Max) * (Max - Min) + Min
-- local SliderNonPrecise = math.floor(((Position.X.Scale * Max) / Max) * (Max - Min) + Min)
-- local SliderValue = Precise and SliderNonPrecise or SliderPrecise
-- SliderValue = tonumber(string.format("%.2f", SliderValue))
-- GlobalSliderValue = SliderValue
-- Slider.Value.PlaceholderText = tostring(SliderValue)
-- Callback(GlobalSliderValue)
-- end
-- local function SetValue(Value)
-- GlobalSliderValue = Value
-- Slider.Slider.Bar.Size = UDim2.new(Value / Max,0,1,0)
-- Slider.Value.PlaceholderText = Value
-- Callback(Value)
-- end
-- Slider.Value.FocusLost:Connect(function()
-- if not tonumber(Slider.Value.Text) then
-- Slider.Value.Text = GlobalSliderValue
-- elseif Slider.Value.Text == "" or tonumber(Slider.Value.Text) <= Min then
-- Slider.Value.Text = Min
-- elseif Slider.Value.Text == "" or tonumber(Slider.Value.Text) >= Max then
-- Slider.Value.Text = Max
-- end

-- GlobalSliderValue = Slider.Value.Text
-- Slider.Slider.Bar.Size = UDim2.new(Slider.Value.Text / Max,0,1,0)
-- Slider.Value.PlaceholderText = Slider.Value.Text
-- Callback(tonumber(Slider.Value.Text))
-- Slider.Value.Text = ""
-- end)

-- Slider.InputBegan:Connect(function(Input)
-- if Input.UserInputType == Enum.UserInputType.MouseButton1 then
-- Sliding(Input)
-- Dragging = true
-- end
-- end)

-- Slider.InputEnded:Connect(function(Input)
-- if Input.UserInputType == Enum.UserInputType.MouseButton1 then
-- Dragging = false
-- end
-- end)

-- UserInputService.InputBegan:Connect(function(Input)
-- if Input.KeyCode == Enum.KeyCode.LeftControl then
-- Slider.Value.ZIndex = 4
-- end
-- end)

-- UserInputService.InputEnded:Connect(function(Input)
-- if Input.KeyCode == Enum.KeyCode.LeftControl then
-- Slider.Value.ZIndex = 3
-- end
-- end)

-- UserInputService.InputChanged:Connect(function(Input)
-- if Dragging and Input.UserInputType == Enum.UserInputType.MouseMovement then
-- Sliding(Input)
-- end
-- end)

-- function SliderInit:AddToolTip(Name)
-- if tostring(Name):gsub(" ", "") ~= "" then
-- Slider.MouseEnter:Connect(function()
-- Screen.ToolTip.Text = Name
-- Screen.ToolTip.Size = UDim2.new(0,Screen.ToolTip.TextBounds.X + 5,0,Screen.ToolTip.TextBounds.Y + 5)
-- Screen.ToolTip.Visible = true
-- end)

-- Slider.MouseLeave:Connect(function()
-- Screen.ToolTip.Visible = false
-- end)
-- end
-- end

-- if Default == nil then
-- function SliderInit:SetValue(Value)
-- GlobalSliderValue = Value
-- Slider.Slider.Bar.Size = UDim2.new(Value / Max,0,1,0)
-- Slider.Value.PlaceholderText = Value
-- Callback(Value)
-- end
-- else
-- SetValue(DefaultLocal)
-- end

-- function SliderInit:GetValue(Value)
-- return GlobalSliderValue
-- end

-- return SliderInit
-- end
-- function SectionInit:CreateDropdown(Name, OptionTable, Callback, InitialValue)
-- local DropdownInit = {}
-- local Dropdown = Folder.Dropdown:Clone()
-- Dropdown.Name = Name .. " D"
-- Dropdown.Parent = Section.Container

-- Dropdown.Title.Text = Name
-- Dropdown.Title.Size = UDim2.new(1,0,0,Dropdown.Title.TextBounds.Y + 5)
-- Dropdown.Container.Position = UDim2.new(0,0,0,Dropdown.Title.TextBounds.Y + 5)
-- Dropdown.Size = UDim2.new(1,-10,0,Dropdown.Title.TextBounds.Y + 25)

-- local DropdownToggle = false

-- Dropdown.MouseButton1Click:Connect(function()
-- DropdownToggle = not DropdownToggle
-- if DropdownToggle then
-- Dropdown.Size = UDim2.new(1,-10,0,Dropdown.Container.Holder.Container.ListLayout.AbsoluteContentSize.Y + Dropdown.Title.TextBounds.Y + 30)
-- Dropdown.Container.Holder.Visible = true
-- else
-- Dropdown.Size = UDim2.new(1,-10,0,Dropdown.Title.TextBounds.Y + 25)
-- Dropdown.Container.Holder.Visible = false
-- end
-- end)

-- for _,OptionName in pairs(OptionTable) do
-- local Option = Folder.Option:Clone()
-- Option.Name = OptionName
-- Option.Parent = Dropdown.Container.Holder.Container

-- Option.Title.Text = OptionName
-- Option.BackgroundColor3 = Config.Color
-- Option.Size = UDim2.new(1,0,0,Option.Title.TextBounds.Y + 5)
-- Dropdown.Container.Holder.Size = UDim2.new(1,-5,0,Dropdown.Container.Holder.Container.ListLayout.AbsoluteContentSize.Y)
-- table.insert(Library.ColorTable, Option)

-- Option.MouseButton1Down:Connect(function()
-- Option.BackgroundTransparency = 0
-- end)

-- Option.MouseButton1Up:Connect(function()
-- Option.BackgroundTransparency = 1
-- end)

-- Option.MouseLeave:Connect(function()
-- Option.BackgroundTransparency = 1
-- end)

-- Option.MouseButton1Click:Connect(function()
-- Dropdown.Container.Value.Text = OptionName
-- Callback(OptionName)
-- end)
-- end
-- function DropdownInit:AddToolTip(Name)
-- if tostring(Name):gsub(" ", "") ~= "" then
-- Dropdown.MouseEnter:Connect(function()
-- Screen.ToolTip.Text = Name
-- Screen.ToolTip.Size = UDim2.new(0,Screen.ToolTip.TextBounds.X + 5,0,Screen.ToolTip.TextBounds.Y + 5)
-- Screen.ToolTip.Visible = true
-- end)

-- Dropdown.MouseLeave:Connect(function()
-- Screen.ToolTip.Visible = false
-- end)
-- end
-- end

-- function DropdownInit:GetOption()
-- return Dropdown.Container.Value.Text
-- end
-- function DropdownInit:SetOption(Name)
-- for _,Option in pairs(Dropdown.Container.Holder.Container:GetChildren()) do
-- if Option:IsA("TextButton") and string.find(Option.Name, Name) then
-- Dropdown.Container.Value.Text = Option.Name
-- Callback(Name)
-- end
-- end
-- end
-- function DropdownInit:RemoveOption(Name)
-- for _,Option in pairs(Dropdown.Container.Holder.Container:GetChildren()) do
-- if Option:IsA("TextButton") and string.find(Option.Name, Name) then
-- Option:Destroy()
-- end
-- end
-- Dropdown.Container.Holder.Size = UDim2.new(1,-5,0,Dropdown.Container.Holder.Container.ListLayout.AbsoluteContentSize.Y)
-- Dropdown.Size = UDim2.new(1,-10,0,Dropdown.Container.Holder.Container.ListLayout.AbsoluteContentSize.Y + Dropdown.Title.TextBounds.Y + 30)
-- end
-- function DropdownInit:ClearOptions()
-- for _, Option in pairs(Dropdown.Container.Holder.Container:GetChildren()) do
-- if Option:IsA("TextButton") then
-- Option:Destroy()
-- end
-- end
-- Dropdown.Container.Holder.Size = UDim2.new(1,-5,0,Dropdown.Container.Holder.Container.ListLayout.AbsoluteContentSize.Y)
-- Dropdown.Size = UDim2.new(1,-10,0,Dropdown.Container.Holder.Container.ListLayout.AbsoluteContentSize.Y + Dropdown.Title.TextBounds.Y + 30)
-- end
-- if InitialValue then
-- DropdownInit:SetOption(InitialValue)
-- end
-- return DropdownInit
-- end
-- function SectionInit:CreateColorpicker(Name,Callback)
-- local ColorpickerInit = {}
-- local Colorpicker = Folder.Colorpicker:Clone()
-- local Pallete = Folder.Pallete:Clone()

-- Colorpicker.Name = Name .. " CP"
-- Colorpicker.Parent = Section.Container
-- Colorpicker.Title.Text = Name
-- Colorpicker.Size = UDim2.new(1,-10,0,Colorpicker.Title.TextBounds.Y + 5)

-- Pallete.Name = Name .. " P"
-- Pallete.Parent = Screen

-- local ColorTable = {
-- Hue = 1,
-- Saturation = 0,
-- Value = 0
-- }
-- local ColorRender = nil
-- local HueRender = nil
-- local ColorpickerRender = nil
-- local function UpdateColor()
-- Colorpicker.Color.BackgroundColor3 = Color3.fromHSV(ColorTable.Hue,ColorTable.Saturation,ColorTable.Value)
-- Pallete.GradientPallete.BackgroundColor3 = Color3.fromHSV(ColorTable.Hue,1,1)
-- Pallete.Input.InputBox.PlaceholderText = "RGB: " .. math.round(Colorpicker.Color.BackgroundColor3.R* 255) .. "," .. math.round(Colorpicker.Color.BackgroundColor3.G * 255) .. "," .. math.round(Colorpicker.Color.BackgroundColor3.B * 255)
-- Callback(Colorpicker.Color.BackgroundColor3)
-- end

-- Colorpicker.MouseButton1Click:Connect(function()
-- if not Pallete.Visible then
-- ColorpickerRender = RunService.RenderStepped:Connect(function()
-- Pallete.Position = UDim2.new(0,Colorpicker.Color.AbsolutePosition.X - 129,0,Colorpicker.Color.AbsolutePosition.Y + 52)
-- end)
-- Pallete.Visible = true
-- else
-- Pallete.Visible = false
-- ColorpickerRender:Disconnect()
-- end
-- end)

-- Pallete.GradientPallete.InputBegan:Connect(function(Input)
-- if Input.UserInputType == Enum.UserInputType.MouseButton1 then
-- if ColorRender then
-- ColorRender:Disconnect()
-- end
-- ColorRender = RunService.RenderStepped:Connect(function()
-- local Mouse = UserInputService:GetMouseLocation()
-- local ColorX = math.clamp(Mouse.X - Pallete.GradientPallete.AbsolutePosition.X, 0, Pallete.GradientPallete.AbsoluteSize.X) / Pallete.GradientPallete.AbsoluteSize.X
-- local ColorY = math.clamp((Mouse.Y - 37) - Pallete.GradientPallete.AbsolutePosition.Y, 0, Pallete.GradientPallete.AbsoluteSize.Y) / Pallete.GradientPallete.AbsoluteSize.Y
-- Pallete.GradientPallete.Dot.Position = UDim2.new(ColorX,0,ColorY,0)
-- ColorTable.Saturation = ColorX
-- ColorTable.Value = 1 - ColorY
-- UpdateColor()
-- end)
-- end
-- end)

-- Pallete.GradientPallete.InputEnded:Connect(function(Input)
-- if Input.UserInputType == Enum.UserInputType.MouseButton1 then
-- if ColorRender then
-- ColorRender:Disconnect()
-- end
-- end
-- end)

-- Pallete.ColorSlider.InputBegan:Connect(function(Input)
-- if Input.UserInputType == Enum.UserInputType.MouseButton1 then
-- if HueRender then
-- HueRender:Disconnect()
-- end
-- HueRender = RunService.RenderStepped:Connect(function()
-- local Mouse = UserInputService:GetMouseLocation()
-- local HueX = math.clamp(Mouse.X - Pallete.ColorSlider.AbsolutePosition.X, 0, Pallete.ColorSlider.AbsoluteSize.X) / Pallete.ColorSlider.AbsoluteSize.X
-- ColorTable.Hue = 1 - HueX
-- UpdateColor()
-- end)
-- end
-- end)

-- Pallete.ColorSlider.InputEnded:Connect(function(Input)
-- if Input.UserInputType == Enum.UserInputType.MouseButton1 then
-- if HueRender then
-- HueRender:Disconnect()
-- end
-- end
-- end)

-- function ColorpickerInit:UpdateColor(Color)
-- local Hue, Saturation, Value = Color:ToHSV()
-- Colorpicker.Color.BackgroundColor3 = Color3.fromHSV(Hue,Saturation,Value)
-- Pallete.GradientPallete.BackgroundColor3 = Color3.fromHSV(Hue,1,1)
-- Pallete.Input.InputBox.PlaceholderText = "RGB: " .. math.round(Colorpicker.Color.BackgroundColor3.R* 255) .. "," .. math.round(Colorpicker.Color.BackgroundColor3.G * 255) .. "," .. math.round(Colorpicker.Color.BackgroundColor3.B * 255)
-- ColorTable = {
-- Hue = Hue,
-- Saturation = Saturation,
-- Value = Value
-- }
-- Callback(Color)
-- end

-- Pallete.Input.InputBox.FocusLost:Connect(function(Enter)
-- if Enter then
-- local ColorString = string.split(string.gsub(Pallete.Input.InputBox.Text," ", ""), ",")
-- ColorpickerInit:UpdateColor(Color3.fromRGB(ColorString[1],ColorString[2],ColorString[3]))
-- Pallete.Input.InputBox.Text = ""
-- end
-- end)

-- function ColorpickerInit:AddToolTip(Name)
-- if tostring(Name):gsub(" ", "") ~= "" then
-- Colorpicker.MouseEnter:Connect(function()
-- Screen.ToolTip.Text = Name
-- Screen.ToolTip.Size = UDim2.new(0,Screen.ToolTip.TextBounds.X + 5,0,Screen.ToolTip.TextBounds.Y + 5)
-- Screen.ToolTip.Visible = true
-- end)

-- Colorpicker.MouseLeave:Connect(function()
-- Screen.ToolTip.Visible = false
-- end)
-- end
-- end

-- return ColorpickerInit
-- end
-- return SectionInit
-- end
-- return TabInit
-- end
-- return WindowInit
-- end

-- --return Library



local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/aloneanqel1453/test/main/Lib/BracketV3.lua"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))

local Tab1 = Window:CreateTab("Fishing Simulator")


local Section1 = Tab1:CreateSection("")
local Section2 = Tab1:CreateSection("")

local RunService = game:GetService("RunService")
local player = game.Players.LocalPlayer
local hum = player.Character.HumanoidRootPart
local mouse = player:GetMouse()
local tpservice = game:GetService("TeleportService")
local VirtualUser = game:service 'VirtualUser'

local ToolsCache = game:GetService("ReplicatedStorage").ToolsCache[player.UserId]
local plrTools
local bLocation
local fuckMonster
local fuckMobby
local InfiniteJumpEnabled = true
local seacreatureSelectionned
local locationSelected
local eggs
local daertytoado
local daertyupgrade
-- Credits To Charwar for Server Hop
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local File = pcall(function()
	AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
	table.insert(AllIDs, actualHour)
	writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end


-- Server Hop
function TPReturner()
	local Site;
	if foundAnything == "" then
		Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' ..
			PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
	else
		Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' ..
			PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
	end
	local ID = ""
	if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
		foundAnything = Site.nextPageCursor
	end
	local num = 0;
	for i, v in pairs(Site.data) do
		local Possible = true
		ID = tostring(v.id)
		if tonumber(v.maxPlayers) > tonumber(v.playing) then
			for _, Existing in pairs(AllIDs) do
				if num ~= 0 then
					if ID == tostring(Existing) then
						Possible = false
					end
				else
					if tonumber(actualHour) ~= tonumber(Existing) then
						local delFile = pcall(function()
							delfile("NotSameServers.json")
							AllIDs = {}
							table.insert(AllIDs, actualHour)
						end)
					end
				end
				num = num + 1
			end
			if Possible == true then
				table.insert(AllIDs, ID)
				wait()
				pcall(function()
					writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
					wait()
					game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
				end)
				wait(4)
			end
		end
	end
end

function switchServer()
	while wait() do
		pcall(function()
			TPReturner()
			if foundAnything ~= "" then
				TPReturner()
			end
		end)
	end
end

function teleport(loc)
	bLocation = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	if game.Players.LocalPlayer.Character.Humanoid.Sit then
		game.Players.LocalPlayer.Character.Humanoid.Sit = false
	end
	wait()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = loc
end

-- Get Tools Name (Just hidden the tool in replicatedstorage, savageeeee but characte win)
for i, getTools in pairs(player.Character:GetChildren()) do
	if getTools:IsA("Tool") and getTools:FindFirstChild("GripC1") then
		plrTools = getTools.Name
	end
end

function EquipTool()
	game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.SetEquippedItem:InvokeServer(2)
	local args = {
		[1] = game:GetService("ReplicatedStorage").ToolsCache:FindFirstChild(player.UserId)[plrTools]
	}
	game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.EquipTool:FireServer(unpack(args))
end

game:service 'Players'.LocalPlayer.Idled:connect(function()
	VirtualUser:CaptureController()
	VirtualUser:ClickButton2(Vector2.new())
end)

-------------





-------------------------------------------------------



Section1:CreateLabel("Farming")

local Toggle6 = Section1:CreateToggle("Auto Kill", nil, function(State)
	shared.toggle = State
	if shared.toggle then
		fuckMonster = RunService.Stepped:Connect(function()
			for i, v in pairs(game.Workspace:GetChildren()) do
				if v:FindFirstChild("Health") and v:FindFirstChild("IsSeaMonster") then
					if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then


						for i, getTools in pairs(player.Character:GetChildren()) do
							if getTools:IsA("Tool") and getTools:FindFirstChild("GripC1") then
								plrTools = getTools.Name
							end
						end

						teleport(v.HumanoidRootPart.CFrame + Vector3.new(0, 30, 0))
						wait(1)
						game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.MonsterHit:FireServer(workspace[v.Name],
							tostring(plrTools), true)
						break
					elseif not game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
						EquipTool()
						break
					end
				end
			end
		end)
	else
		fuckMonster:Disconnect()
		teleport(CFrame.new(1.8703980445862, 53.57190322876, -188.37982177734))
	end
end)

local Toggle11 = Section1:CreateToggle("Auto Kill Mobby Wood", nil, function(State)
	shared.toggle = State
	if shared.toggle then
		fuckMobby = RunService.Stepped:Connect(function()
			for i, v in pairs(game.Workspace:GetChildren()) do
				if v:FindFirstChild("Health") and v:FindFirstChild("IsSeaMonster") and v.Name == "MobyWood" then
					if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then


						for i, getTools in pairs(player.Character:GetChildren()) do
							if getTools:IsA("Tool") and getTools:FindFirstChild("GripC1") then
								plrTools = getTools.Name
							end
						end

						teleport(v.HumanoidRootPart.CFrame + Vector3.new(0, 50, 0))
						wait(1)
						game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.MonsterHit:FireServer(workspace[v.Name],
							tostring(plrTools), true)
						break
					elseif not game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
						EquipTool()
						break
					end
				end
			end
		end)
	else
		fuckMobby:Disconnect()
		teleport(CFrame.new(1.8703980445862, 53.57190322876, -188.37982177734))
	end
end)


local Toggle8 = Section1:CreateToggle("Reduce Lag", nil, function(State)
	toggle = State
	if toggle then
		while toggle do
			
			for i, v in pairs(game.Workspace.DroppedItems:GetChildren()) do
				if v:IsA("Model") then
					v:Destroy()
				end
			end
			wait(30)
		end
	end
end)

local Toggle10 = Section1:CreateToggle("Auto Lock Rare Items", nil, function(State)
	toggle = State
	if toggle then
		while toggle do
			wait(.1)
			for i, v in pairs(game.Players.LocalPlayer.PlayerGui.Interface.Inventory.Inventory.Frame.Backpack.List.Container:
				GetChildren()) do
				if string.match(v.Name, "key") then
					for i, model in pairs(v:GetDescendants()) do
						if model:IsA("Tool") then
							if model.RarityLevel.Value >= 4 then

								if v.DraggableComponent.Contents.LockIcon.Visible == false then
									print(v.Name, model.Name, model.RarityLevel.Value)
									local args = {
										[1] = "Tools",
										[2] = v.Name,
										[3] = true
									}
									game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.SetInventoryItemLock:InvokeServer(unpack(args))

								end
							end
						end
					end
				end
			end

		end
	end
end)

Toggle10:AddToolTip("Rarity Locked: \nEpic \nLegendary \nEvent \nSecret")

local Toggle1 = Section1:CreateToggle("Auto Caught", nil, function(State)
	toggle = State
	while toggle do
		wait(2.6)

		game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.FishCaught:FireServer()
	end
end)

local Toggle2 = Section1:CreateToggle("Auto Sell", nil, function(State)
	toggle = State
	while toggle do
		
		game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.processGameItemSold:InvokeServer("SellEverything")
		wait(math.random(60,120))
	end
end)

local Toggle3 = Section1:CreateToggle("Remove Fog", nil, function(State)
	toggle = State
	while toggle do
		if game.Lighting.FogEnd == 100 then
			game.Lighting.FogEnd = 1000000
		end
		game.Lighting.FogEnd = 1000000
		game.Lighting.GlobalLighting:Destroy()
		game.Lighting.Atmosphere:Destroy()
		game.Lighting.Lighting:Destroy()
		game.Lighting.ColorCorrection:Destroy()
		game.Lighting.Bloom:Destroy()
		game.Lighting.Blur:Destroy()
		game.Lighting.Atmosphere:Destroy()
	end
end)

local Toggle11 = Section1:CreateToggle("Auto Buy", nil, function(State)
	toggle = State

	if toggle then
		while toggle do
			wait(3)
			if eggs == "Royals" then
				game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("royalegg")
			elseif eggs == "Normal" then
				game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("normalegg")
			elseif eggs == "Ruby" then
				game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("rubyegg")
			elseif eggs == "Void" then
				game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("voidegg")
			elseif eggs == "Silver" then
				game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("silverchest")
			elseif eggs == "Stone" then
				game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("stonechest")
			elseif eggs == "Gold" then
				game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("goldchest")
			end
		end
	end
end)
local Dropdown5 = Section1:CreateDropdown("Upgrade", { "Hook Speed", "Reeling Speed", "Strength" }, function(String)
	daertyupgrade = String
end)
local Toggle12 = Section1:CreateToggle("Auto Upgrade", nil, function(State)
	toggle = State

	if toggle then
		while toggle do
			wait(4)
			local args = {
				[1] = "Upgrade",
				[2] = "FinnsSuppliesShop",
				[3] = "FishingRod",
				[4] = "",
				[5] = {
					["statName"] = daertyupgrade
				}
			}
			game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.processGameItemPurchase:InvokeServer(unpack(args))
		end
	end
end)

Section1:CreateLabel("Chest")

local Toggle4 = Section1:CreateToggle("Daily Chest", nil, function(State)
	toggle = State
	while toggle do
		wait(5)
		for i, v in pairs(game.Workspace.Islands:GetDescendants()) do
			if v:IsA("Model") and string.match(v.Name, "Chest") then
				daerty = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
				eleport(v.HumanoidRootPart.CFrame)
				wait(1)
				fireproximityprompt(v.HumanoidRootPart.ProximityPrompt)
				wait(1)
				teleport(daerty)
			end
		end
	end
end)

local Toggle9 = Section1:CreateToggle("Random Chest", nil, function(State)
	toggle = State
	while toggle do
		wait(5)
		for i, v in pairs(game.Workspace.RandomChests:GetDescendants()) do
			if v:IsA("Model") and string.match(v.Name, "Chest") then
				daerty = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
				teleport(v.HumanoidRootPart.CFrame)
				wait(1)
				fireproximityprompt(v.HumanoidRootPart.ProximityPrompt)
				wait(1)
				teleport(daerty)
				wait(1)
			end
		end
	end
end)

local Toggle5 = Section1:CreateToggle("Suken Chest", nil, function(State)
	toggle = State
	while toggle do


		for i, v in pairs(game.Workspace:GetChildren()) do
			if string.find(v.Name, "RandomChests") then

				for ii, vv in pairs(v:GetDescendants()) do
					if vv:IsA("Model") and string.match(vv.Name, "Chest") then
						daerty = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
						teleport(vv.HumanoidRootPart.CFrame)
						wait(1)
						fireproximityprompt(vv.HumanoidRootPart.ProximityPrompt)
						wait(1)
						teleport(daerty)
						wait(1)
						
					end
				end

			elseif string.find(v.Name, "ShipModel") then
				toadotemp = v.HitBox.CFrame
				if daertytoado ~= toadotemp then
					daerty = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

					teleport(toadotemp)
					for i, x in pairs(v:GetChildren()) do
						if string.match(x.Name, "Chest_") then
							teleport(x.HumanoidRootPart.CFrame)
							wait(1)
							fireproximityprompt(x.HumanoidRootPart.ProximityPrompt)
							teleport(daerty)
							wait(1)
						else
							daertytoado = toadotemp
							teleport(daerty)
							wait(1)
						
						end
					end
				end
				break
			end

		end
		wait(5)
	end
end)


---------------------------------------------------------------------
Section1:CreateLabel("Teleport")

local Dropdown2 = Section1:CreateDropdown("Store", { "Boat Store", "Raygan's Tavern", "Supplies Store", "Pets Store" },
	function(String)
		locationSelected = String
	end)

local Button1 = Section1:CreateButton("Teleport", function()
	if locationSelected == "Boat Store" then
		game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.EnterDoor:InvokeServer("BoatShopInterior", "Inside")
	elseif locationSelected == "Raygan's Tavern" then
		game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.EnterDoor:InvokeServer("TavernInterior", "Inside")
	elseif locationSelected == "Supplies Store" then
		game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.EnterDoor:InvokeServer("SuppliesStoreInterior",
			"Inside")
	elseif locationSelected == "Pets Store" then
		game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.EnterDoor:InvokeServer("PetShop", "MainEntrance")
	end
end)

local Dropdown3 = Section1:CreateDropdown("Location",
	{ "Port Jackson", "Ancient Shores", "Shadow Isles", "Pharaoh's Dunes", "Eruption Island", "Monster's Borough",
		"Suken Ship" }, function(String)
	locationSelected = String
end)

local Button2 = Section1:CreateButton("Teleport", function()
	if locationSelected == "Port Jackson" then
		teleport(CFrame.new(1.8703980445862, 53.57190322876, -188.37982177734))
	elseif locationSelected == "Ancient Shores" then
		teleport(CFrame.new(-2436.431640625, 43.564971923828, -1683.4526367188))
	elseif locationSelected == "Shadow Isles" then
		teleport(CFrame.new(2196.9926757812, 43.491630554199, -2216.4543457031))
	elseif locationSelected == "Pharaoh's Dunes" then
		teleport(CFrame.new(-4142.74609375, 46.71378326416, 262.05679321289))
	elseif locationSelected == "Eruption Island" then
		teleport(CFrame.new(3022.9311523438, 52.347640991211, 1323.74609375))
	elseif locationSelected == "Monster's Borough" then
		teleport(CFrame.new(-3211.9047851562, 41.850345611572, 2735.306640625))
	elseif locationSelected == "Suken Ship" then
		for i, v in pairs(game.Workspace:GetChildren()) do
			if string.find(v.Name, "ShipModel") then
				teleport(v.HitBox.CFrame)
				break
			end
		end
	end
end)

Section2:CreateLabel("Boats")

local Slider1 = Section2:CreateSlider("Boat Speed", 0, 150, nil, true, function(Value)
	for i, v in pairs(game.Workspace:GetChildren()) do
		if v.Name == (game.Players.LocalPlayer.Name .. "'s Boat") then
			v.Controller.VehicleSeat.MaxSpeed = tonumber(Value)
		end
	end
end)

local Button3 = Section2:CreateButton("Tp to Boat", function()
	for i, v in pairs(game.Workspace:GetChildren()) do
		if v.Name == (game.Players.LocalPlayer.Name .. "'s Boat") then
			teleport(v.Controller.VehicleSeat.CFrame + Vector3.new(0, 3, 0))
		end
	end
end)

local Button4 = Section2:CreateButton("Remove Borders", function()
	for i, v in pairs(game.Workspace.IgnoredByMouse.BoatBorders:GetChildren()) do
		v:Destroy()
	end
end)

Section2:CreateLabel("Pets")


local Dropdown4 = Section2:CreateDropdown("Egg's", { "Royals", "Normal", "Ruby", "Void", "Silver", "Stone", "Gold" },
	function(String)
		eggs = String
	end)

local Button8 = Section2:CreateButton("Buy", function()

	if eggs == "Royals" then
		game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("royalegg")
	elseif eggs == "Normal" then
		game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("normalegg")
	elseif eggs == "Ruby" then
		game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("rubyegg")
	elseif eggs == "Void" then
		game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("voidegg")
	elseif eggs == "Silver" then
		game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("silverchest")
	elseif eggs == "Stone" then
		game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("stonechest")
	elseif eggs == "Gold" then
		game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("goldchest")
	end
end)

Section2:CreateLabel("Misc")


local Button8 = Section2:CreateButton("Instant ProximityPrompt", function()
	game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt)
		prompt.HoldDuration = 0
	end)
end)

local Button5 = Section2:CreateButton("Rejoins", function()
	tpservice:Teleport(game.PlaceId, plr)
end)

local Button6 = Section2:CreateButton("Server Hop", function()
	switchServer()
end)
local Button8 = Section2:CreateButton("Performance On", function()
	RunService:Set3dRenderingEnabled(false)
	settings().Rendering.QualityLevel = 1
	setfpscap(6)
end)
local Button9 = Section2:CreateButton("Performance Off", function()
	RunService:Set3dRenderingEnabled(true)
	settings().Rendering.QualityLevel = 1
	setfpscap(60)

end)
local Button10 = Section2:CreateButton("jump inf",function ()
	game:GetService("UserInputService").JumpRequest:connect(function()
		if InfiniteJumpEnabled then
			game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
		end
	end)
end)

local Button7 = Section2:CreateButton("Discord", function()
	setclipboard("HUnTFaE4H6")
end)

local Toggle7 = Section2:CreateToggle("UI Toggle", nil, function(State)
	Window:Toggle(State)
end)

Toggle7:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)
	Config.Keybind = Enum.KeyCode[Key]
end)
Toggle7:SetState(true)

EquipTool()
game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(character)
	EquipTool()
end)

--Hi
