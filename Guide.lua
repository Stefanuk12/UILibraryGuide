--[[
    UI Library Guide

    Information:
        - This guide uses International (British) English spelling so please abide by that

    Guidance:
        - If your library does not support everything or has more, you can edit this. Make sure to stick by the same stuff ish

    To Do:
        - Type Checking
        - Add additional components
        - Add additional methods like ChangeTitle, etc.
]]

-- // Dependencies
local SignalManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stefanuk12/Signal/main/Manager.lua"))()

-- // Services
local UserInputService = game:GetService("UserInputService")

-- // Button class
local Button = {}
Button.__index = Button
Button.__type = "Button"
do
    -- // Vars
    local this = Button -- // makes it easier to copy and paste methods across

    this.AllSignals = {
        "Clicked"
    }
    this.DefaultSettings = {
        Parent = "nil",

        Title = "New Button",

        Callback = function()

        end
    }

    -- // Constructor - initialises the object and instance
    function this.new(Data)
        -- // Create the object
        local self = setmetatable({}, this)

        -- // Initialising the settings
        self:InitialiseSettings(Data)

        -- // Create the instance
        self.Instance = self:CreateInstance()

        -- // Create the signal manager
        self.Signals = SignalManager.new()
        self:InitialiseSignals()

        -- // Return object
        return self
    end

    -- // Creates the instance
    function this.CreateInstance(self)
        -- // Put your code here, return an Instance like a Frame or whatever
        -- // Also, in addition to firing the callback, fire self.Signals:Fire("Clicked")
    end

    -- // Updates the instance, reflecting any changes seen within the Data. This is fired whenever the Clicked event is fired.
    function this.UpdateInstance(self)
        -- // Put your code here, no need for a return
    end

    -- // Loads default settings with given data
    function this.InitialiseSettings(self, Data)
        -- // Make sure we have data
        Data = Data or {}

        -- // Loop through defaults and set
        for i, v in pairs(this.DefaultSettings) do
            self[i] = Data[i] or v
        end

        -- // Return
        return self
    end

    -- // Creates all of the signals, ready to be fire and connected to
    function this.InitialiseSignals(self)
        -- // Loop through each signal
        for _, v in ipairs(this.AllSignals) do
            -- // Add it
            self.Signals:Add(v)
        end

        -- // Listen to clicked
        self.Signals:Connect("Clicked", function()
            -- // Update the instance
            self:UpdateInstance()
        end)
    end
end

-- // Toggle class - all state related things are in reference to whether the toggle is toggled or not
local Toggle = {}
Toggle.__index = Toggle
Toggle.__type = "Toggle"
do
    -- // Vars
    local this = Toggle -- // makes it easier to copy and paste methods across

    this.AllSignals = {
        "Clicked",
        "Changed"
    }
    this.DefaultSettings = {
        Parent = "nil",

        Title = "New Toggle",
        State = false,

        Callback = function(NewState, OldState)

        end
    }

    -- // Constructor - initialises the object and instance
    function this.new(Data)
        -- // Create the object
        local self = setmetatable({}, this)

        -- // Initialising the settings
        self:InitialiseSettings(Data)

        -- // Create the instance
        self.Instance = self:CreateInstance()

        -- // Create the signal manager
        self.Signals = SignalManager.new()
        self:InitialiseSignals()

        -- // Return object
        return self
    end

    -- // Creates the instance
    function this.CreateInstance(self)
        -- // Put your code here, return an Instance like a Frame or whatever
        -- // Also, in addition to firing the callback, fire self.Signals:Fire("Clicked")
        -- // As well as self.Signals:Fire("Changed", NewState, OldState)
        -- // Or use the self:Set state which handles this for you
    end

    -- // Updates the instance, reflecting any changes seen within the Data. This is fired whenever any changes are made with the Set method.
    function this.UpdateInstance(self)
        -- // Put your code here, no need for a return
    end

    -- // Gets the current state
    function this.Get(self)
        return self.State
    end

    -- // Sets the current state
    function this.Set(self, NewState)
        local OldState = self.State

        if (NewState == nil) then
            NewState = not self.State
        end
        self.State = NewState

        self.Signals:Fire("Clicked")
        self.Signals:Fire("Changed", NewState, OldState)

        self.Callback(NewState, OldState)

        self:UpdateInstance()
    end

    -- // Loads default settings with given data
    function this.InitialiseSettings(self, Data)
        -- // Make sure we have data
        Data = Data or {}

        -- // Loop through defaults and set
        for i, v in pairs(this.DefaultSettings) do
            self[i] = Data[i] or v
        end

        -- // Return
        return self
    end

    -- // Creates all of the signals, ready to be fire and connected to
    function this.InitialiseSignals(self)
        -- // Loop through each signal
        for _, v in ipairs(this.AllSignals) do
            -- // Add it
            self.Signals:Add(v)
        end
    end
end

-- // Text Box class - all state related things are in reference to the text in the box
local TextBox = {}
TextBox.__index = TextBox
TextBox.__type = "TextBox"
do
    -- // Vars
    local this = TextBox -- // makes it easier to copy and paste methods across

    this.AllSignals = {
        "Clicked",
        "Changed"
    }
    this.DefaultSettings = {
        Parent = "nil",

        Title = "New Text Box",
        State = "nil",

        Callback = function(NewState, OldState)

        end
    }

    -- // Constructor - initialises the object and instance
    function this.new(Data)
        -- // Create the object
        local self = setmetatable({}, this)

        -- // Initialising the settings
        self:InitialiseSettings(Data)

        -- // Create the instance
        self.Instance = self:CreateInstance()

        -- // Create the signal manager
        self.Signals = SignalManager.new()
        self:InitialiseSignals()

        -- // Return object
        return self
    end

    -- // Creates the instance
    function this.CreateInstance(self)
        -- // Put your code here, return an Instance like a Frame or whatever
        -- // Also, in addition to firing the callback, fire self.Signals:Fire("Clicked")
        -- // As well as self.Signals:Fire("Changed", NewState, OldState)
        -- // Or use the self:Set state which handles this for you
        -- // Make sure to only call Set when the user ends their input, e.g. when enter is pressed
    end

    -- // Updates the instance, reflecting any changes seen within the Data. This is fired whenever any changes are made with the Set method.
    function this.UpdateInstance(self)
        -- // Put your code here, no need for a return
    end

    -- // Gets the current state
    function this.Get(self)
        return self.State
    end

    -- // Sets the current state
    function this.Set(self, NewState)
        local OldState = self.State

        if (NewState == nil) then
            NewState = not self.State
        end
        self.State = NewState

        self.Signals:Fire("Clicked")
        self.Signals:Fire("Changed", NewState, OldState)

        self.Callback(NewState, OldState)

        self:UpdateInstance()
    end

    -- // Loads default settings with given data
    function this.InitialiseSettings(self, Data)
        -- // Make sure we have data
        Data = Data or {}

        -- // Loop through defaults and set
        for i, v in pairs(this.DefaultSettings) do
            self[i] = Data[i] or v
        end

        -- // Return
        return self
    end

    -- // Creates all of the signals, ready to be fire and connected to
    function this.InitialiseSignals(self)
        -- // Loop through each signal
        for _, v in ipairs(this.AllSignals) do
            -- // Add it
            self.Signals:Add(v)
        end
    end
end

-- // Keybind class - all state related things are in reference to the selected keybind
local Keybind = {}
local Keybinds = {} -- // Holds all of the active keybinds (as keybind class)
Keybind.__index = Keybind
Keybind.__type = "Keybind"
do
    -- // Vars
    local this = Keybind -- // makes it easier to copy and paste methods across

    this.AllSignals = {
        "Clicked",
        "Changed"
    }
    this.DefaultSettings = {
        Parent = "nil",

        Title = "New Keybind",
        State = Enum.KeyCode.Unknown,

        Callback = function(NewState, OldState) -- // Called when the keybind is changed

        end,
        PressedCallback = function() -- // Called when the keybind is pressed

        end
    }

    -- // Constructor - initialises the object and instance
    function this.new(Data)
        -- // Create the object
        local self = setmetatable({}, this)

        -- // Initialising the settings
        self:InitialiseSettings(Data)

        -- // Create the instance
        self.Instance = self:CreateInstance()

        -- // Create the signal manager
        self.Signals = SignalManager.new()
        self:InitialiseSignals()

        -- // Add self to keybinds
        table.insert(Keybinds, self)

        -- // Return object
        return self
    end

    -- // Creates the instance
    function this.CreateInstance(self)
        -- // Put your code here, return an Instance like a Frame or whatever
        -- // Also, in addition to firing the callback, fire self.Signals:Fire("Clicked")
        -- // As well as self.Signals:Fire("Changed", NewState, OldState)
        -- // Or use the self:Set state which handles this for you
        -- // Make sure to only call Set when the user ends their input, e.g. when enter is pressed
    end

    -- // Updates the instance, reflecting any changes seen within the Data. This is fired whenever any changes are made with the Set method.
    function this.UpdateInstance(self)
        -- // Put your code here, no need for a return
    end

    -- // Gets the current state
    function this.Get(self)
        return self.State
    end

    -- // Sets the current state
    function this.Set(self, NewState)
        local OldState = self.State

        if (NewState == nil) then
            NewState = not self.State
        end
        self.State = NewState

        self.Signals:Fire("Clicked")
        self.Signals:Fire("Changed", NewState, OldState)

        self.Callback(NewState, OldState)

        self:UpdateInstance()
    end

    -- // Loads default settings with given data
    function this.InitialiseSettings(self, Data)
        -- // Make sure we have data
        Data = Data or {}

        -- // Loop through defaults and set
        for i, v in pairs(this.DefaultSettings) do
            self[i] = Data[i] or v
        end

        -- // Return
        return self
    end

    -- // Creates all of the signals, ready to be fire and connected to
    function this.InitialiseSignals(self)
        -- // Loop through each signal
        for _, v in ipairs(this.AllSignals) do
            -- // Add it
            self.Signals:Add(v)
        end
    end
end

-- // See when a button is pressed
UserInputService.InputBegan:Connect(function(Input, GameProcessedEvent)
    -- // Make sure was not processed
    if (GameProcessedEvent) then
        return
    end

    -- // Loop through every keybind
    for _, v in pairs(Keybinds) do
        -- // Check if the state and keycode matches
        if (v.State == Input.KeyCode) then
            -- // Call the function
            v.PressedCallback()
        end
    end
end)

-- // Colour Picker class - all state related things are in reference to the current colour
local ColourPicker = {}
Keybind.__index = Keybind
ColourPicker.__type = "ColourPicker"
do
    -- // Vars
    local this = ColourPicker -- // makes it easier to copy and paste methods across

    this.AllSignals = {
        "Clicked",
        "Changed"
    }
    this.DefaultSettings = {
        Parent = "nil",

        Title = "New Colour Picker",
        State = Color3.new(),

        Callback = function(NewState, OldState) -- // Called when the colour is changed

        end
    }

    -- // Constructor - initialises the object and instance
    function this.new(Data)
        -- // Create the object
        local self = setmetatable({}, this)

        -- // Initialising the settings
        self:InitialiseSettings(Data)

        -- // Create the instance
        self.Instance = self:CreateInstance()

        -- // Create the signal manager
        self.Signals = SignalManager.new()
        self:InitialiseSignals()

        -- // Return object
        return self
    end

    -- // Creates the instance
    function this.CreateInstance(self)
        -- // Put your code here, return an Instance like a Frame or whatever
        -- // Also, in addition to firing the callback, fire self.Signals:Fire("Clicked")
        -- // As well as self.Signals:Fire("Changed", NewState, OldState)
        -- // Or use the self:Set state which handles this for you
    end

    -- // Updates the instance, reflecting any changes seen within the Data. This is fired whenever any changes are made with the Set method.
    function this.UpdateInstance(self)
        -- // Put your code here, no need for a return
    end

    -- // Gets the current state
    function this.Get(self)
        return self.State
    end

    -- // Sets the current state
    function this.Set(self, NewState)
        local OldState = self.State

        if (NewState == nil) then
            NewState = not self.State
        end
        self.State = NewState

        self.Signals:Fire("Clicked")
        self.Signals:Fire("Changed", NewState, OldState)

        self.Callback(NewState, OldState)

        self:UpdateInstance()
    end

    -- // Loads default settings with given data
    function this.InitialiseSettings(self, Data)
        -- // Make sure we have data
        Data = Data or {}

        -- // Loop through defaults and set
        for i, v in pairs(this.DefaultSettings) do
            self[i] = Data[i] or v
        end

        -- // Return
        return self
    end

    -- // Creates all of the signals, ready to be fire and connected to
    function this.InitialiseSignals(self)
        -- // Loop through each signal
        for _, v in ipairs(this.AllSignals) do
            -- // Add it
            self.Signals:Add(v)
        end
    end
end

-- // Slider class - all state related things are in reference to the slider value
local Slider = {}
Slider.__index = Slider
Slider.__type = "Slider"
do
    -- // Vars
    local this = Slider -- // makes it easier to copy and paste methods across

    this.AllSignals = {
        "Clicked",
        "Changed"
    }
    this.DefaultSettings = {
        Parent = "nil",

        Title = "New Slider",
        State = 0,

        Min = 0,
        Max = 1,
        Precision = 1, -- // decimal points

        Callback = function(NewState, OldState)

        end
    }

    -- // Constructor - initialises the object and instance
    function this.new(Data)
        -- // Create the object
        local self = setmetatable({}, this)

        -- // Initialising the settings
        self:InitialiseSettings(Data)

        -- // Create the instance
        self.Instance = self:CreateInstance()

        -- // Create the signal manager
        self.Signals = SignalManager.new()
        self:InitialiseSignals()

        -- // Return object
        return self
    end

    -- // Creates the instance
    function this.CreateInstance(self)
        -- // Put your code here, return an Instance like a Frame or whatever
        -- // Also, in addition to firing the callback, fire self.Signals:Fire("Clicked")
        -- // As well as self.Signals:Fire("Changed", NewState, OldState)
        -- // Or use the self:Set state which handles this for you
    end

    -- // Updates the instance, reflecting any changes seen within the Data. This is fired whenever any changes are made with the Set method.
    function this.UpdateInstance(self)
        -- // Put your code here, no need for a return
    end

    -- // Gets the current state
    function this.Get(self)
        return self.State
    end

    -- // Sets the current state
    function this.Set(self, NewState)
        local OldState = self.State

        if (NewState == nil) then
            NewState = not self.State
        end
        self.State = NewState

        self.Signals:Fire("Clicked")
        self.Signals:Fire("Changed", NewState, OldState)

        self.Callback(NewState, OldState)

        self:UpdateInstance()
    end

    -- // Loads default settings with given data
    function this.InitialiseSettings(self, Data)
        -- // Make sure we have data
        Data = Data or {}

        -- // Loop through defaults and set
        for i, v in pairs(this.DefaultSettings) do
            self[i] = Data[i] or v
        end

        -- // Return
        return self
    end

    -- // Creates all of the signals, ready to be fire and connected to
    function this.InitialiseSignals(self)
        -- // Loop through each signal
        for _, v in ipairs(this.AllSignals) do
            -- // Add it
            self.Signals:Add(v)
        end
    end
end

-- // Dropdown class - all state related things are in reference to the currently selected dropdown item
local Dropdown = {}
Dropdown.__index = Dropdown
Dropdown.__type = "Dropdown"
do
    -- // Vars
    local this = Dropdown -- // makes it easier to copy and paste methods across

    this.AllSignals = {
        "Clicked",
        "Changed"
    }
    this.DefaultSettings = {
        Parent = "nil",

        Title = "New Dropdown",
        State = "nil",

        List = {},

        Callback = function(NewState, OldState)

        end
    }

    -- // Constructor - initialises the object and instance
    function this.new(Data)
        -- // Create the object
        local self = setmetatable({}, this)

        -- // Initialising the settings
        self:InitialiseSettings(Data)

        -- // Create the instance
        self.Instance = self:CreateInstance()

        -- // Create the signal manager
        self.Signals = SignalManager.new()
        self:InitialiseSignals()

        -- // Return object
        return self
    end

    -- // Creates the instance
    function this.CreateInstance(self)
        -- // Put your code here, return an Instance like a Frame or whatever
        -- // Also, in addition to firing the callback, fire self.Signals:Fire("Clicked")
        -- // As well as self.Signals:Fire("Changed", NewState, OldState)
        -- // Or use the self:Set state which handles this for you
    end

    -- // Updates the instance, reflecting any changes seen within the Data. This is fired whenever any changes are made with the Set method.
    function this.UpdateInstance(self)
        -- // Put your code here, no need for a return
    end

    -- // Gets the current state
    function this.Get(self)
        return self.State
    end

    -- // Sets the current state
    function this.Set(self, NewState)
        local OldState = self.State

        if (NewState == nil) then
            NewState = not self.State
        end
        self.State = NewState

        self.Signals:Fire("Clicked")
        self.Signals:Fire("Changed", NewState, OldState)

        self.Callback(NewState, OldState)

        self:UpdateInstance()
    end

    -- // Loads default settings with given data
    function this.InitialiseSettings(self, Data)
        -- // Make sure we have data
        Data = Data or {}

        -- // Loop through defaults and set
        for i, v in pairs(this.DefaultSettings) do
            self[i] = Data[i] or v
        end

        -- // Return
        return self
    end

    -- // Creates all of the signals, ready to be fire and connected to
    function this.InitialiseSignals(self)
        -- // Loop through each signal
        for _, v in ipairs(this.AllSignals) do
            -- // Add it
            self.Signals:Add(v)
        end
    end
end

-- // Returns all of the element components
local function GetElementComponents()
    return {
        Button,
        Toggle,
        TextBox,
        Keybind,
        ColourPicker,
        Slider,
        Dropdown
    }
end


-- // Section class - all state related things are in reference to the Section's visibility.
local Section = {}
Section.__index = Section
Section.__type = "Section"
do
    -- // Vars
    local this = Section -- // makes it easier to copy and paste methods across

    this.AllSignals = {
        "Clicked",
        "Changed"
    }
    this.DefaultSettings = {
        Parent = "nil",

        Title = "New Section",
        State = false,

        Callback = function(NewState, OldState)

        end
    }

    -- // Constructor - initialises the object and instance
    function this.new(Data)
        -- // Create the object
        local self = setmetatable({}, this)

        -- // Initialising the settings
        self:InitialiseSettings(Data)

        -- // Create the instance
        self.Instance = self:CreateInstance()

        -- // Create the signal manager
        self.Signals = SignalManager.new()
        self:InitialiseSignals()

        -- // Additional variables
        self.State = false

        -- // Return object
        return self
    end

    -- // Creates the instance
    function this.CreateInstance(self)
        -- // Put your code here, return an Instance like a Frame or whatever
        -- // Also, in addition to firing the callback, fire self.Signals:Fire("Clicked")
        -- // As well as self.Signals:Fire("Changed", NewState, OldState)
        -- // Or use the self:Set state which handles this for you
    end

    -- // Updates the instance, reflecting any changes seen within the Data. This is fired whenever any changes are made with the Set method.
    function this.UpdateInstance(self)
        -- // Put your code here, no need for a return
    end

    -- // Hides the tab
    function this.Hide(self)
        -- // Put your code here that hides the tab
    end

    -- // Shows the tab
    function this.Show(self)
        -- // Put your code here that shows the tab
    end

    -- // Gets the current state
    function this.Get(self)
        return self.State
    end

    -- // Sets the current state
    function this.Set(self, NewState)
        local OldState = self.State

        if (NewState == nil) then
            NewState = not self.State
        end
        self.State = NewState

        self.Signals:Fire("Clicked")
        self.Signals:Fire("Changed", NewState, OldState)

        if (NewState) then
            this:Show()
        else
            this:Hide()
        end

        self.Callback(NewState, OldState)

        self:UpdateInstance()
    end

    -- // Loads default settings with given data
    function this.InitialiseSettings(self, Data)
        -- // Make sure we have data
        Data = Data or {}

        -- // Loop through defaults and set
        for i, v in pairs(this.DefaultSettings) do
            self[i] = Data[i] or v
        end

        -- // Return
        return self
    end

    -- // Creates all of the signals, ready to be fire and connected to
    function this.InitialiseSignals(self)
        -- // Loop through each signal
        for _, v in ipairs(this.AllSignals) do
            -- // Add it
            self.Signals:Add(v)
        end
    end

    -- // Adding all of the element components, e.g. Buttons, Toggles.
    for _, ElementComponent in ipairs(GetElementComponents()) do
        this[ElementComponent.__type] = function(self, Data)
            Data = Data or {}
            Data.Parent = self

            return ElementComponent.new(Data)
        end
    end
end

-- // Tab class - all state related things are in reference to the Tab's visibility. You can think tabs as pages
local Tab = {}
Tab.__index = Tab
Tab.__type = "Tab"
do
    -- // Vars
    local this = Tab -- // makes it easier to copy and paste methods across

    this.AllSignals = {
        "Clicked",
        "Changed"
    }
    this.DefaultSettings = {
        Parent = "nil",

        Title = "New Tab",
        State = false,

        Callback = function(NewState, OldState)

        end
    }

    -- // Constructor - initialises the object and instance
    function this.new(Data)
        -- // Create the object
        local self = setmetatable({}, this)

        -- // Initialising the settings
        self:InitialiseSettings(Data)

        -- // Create the instance
        self.Instance = self:CreateInstance()

        -- // Create the signal manager
        self.Signals = SignalManager.new()
        self:InitialiseSignals()

        -- // Additional variables
        self.State = false

        -- // Return object
        return self
    end

    -- // Creates the instance
    function this.CreateInstance(self)
        -- // Put your code here, return an Instance like a Frame or whatever
        -- // Also, in addition to firing the callback, fire self.Signals:Fire("Clicked")
        -- // As well as self.Signals:Fire("Changed", NewState, OldState)
        -- // Or use the self:Set state which handles this for you
    end

    -- // Updates the instance, reflecting any changes seen within the Data. This is fired whenever any changes are made with the Set method.
    function this.UpdateInstance(self)
        -- // Put your code here, no need for a return
    end

    -- // Hides the tab
    function this.Hide(self)
        -- // Put your code here that hides the tab
    end

    -- // Shows the tab
    function this.Show(self)
        -- // Put your code here that shows the tab
    end

    -- // Gets the current state
    function this.Get(self)
        return self.State
    end

    -- // Sets the current state
    function this.Set(self, NewState)
        local OldState = self.State

        if (NewState == nil) then
            NewState = not self.State
        end
        self.State = NewState

        self.Signals:Fire("Clicked")
        self.Signals:Fire("Changed", NewState, OldState)

        if (NewState) then
            this:Show()
        else
            this:Hide()
        end

        self.Callback(NewState, OldState)

        self:UpdateInstance()
    end

    -- // Loads default settings with given data
    function this.InitialiseSettings(self, Data)
        -- // Make sure we have data
        Data = Data or {}

        -- // Loop through defaults and set
        for i, v in pairs(this.DefaultSettings) do
            self[i] = Data[i] or v
        end

        -- // Return
        return self
    end

    -- // Creates all of the signals, ready to be fire and connected to
    function this.InitialiseSignals(self)
        -- // Loop through each signal
        for _, v in ipairs(this.AllSignals) do
            -- // Add it
            self.Signals:Add(v)
        end
    end

    -- //
    function this.Section(self, Data)
        Data = Data or {}
        Data.Parent = self

        return Section.new(Data)
    end
end

-- // Library class - all state related things are in reference to the Library's visibility
local Library = {}
Library.__index = Library
Library.__type = "Library"
do
    -- // Vars
    local this = Library -- // makes it easier to copy and paste methods across

    this.AllSignals = {
        "Clicked",
        "Changed"
    }
    this.Components = {
        Tab
    }
    this.DefaultSettings = {
        Title = "New Library",
        State = false,

        Callback = function(NewState, OldState)

        end
    }

    -- // Constructor - initialises the object and instance
    function this.new(Data)
        -- // Create the object
        local self = setmetatable({}, this)

        -- // Initialising the settings
        self:InitialiseSettings(Data)

        -- // Create the instance
        self.Instance = self:CreateInstance()

        -- // Create the signal manager
        self.Signals = SignalManager.new()
        self:InitialiseSignals()

        -- // Additional variables
        self.State = false

        -- // Return object
        return self
    end

    -- // Creates the instance
    function this.CreateInstance(self)
        -- // Put your code here, return an Instance like a Frame or whatever
        -- // Also, in addition to firing the callback, fire self.Signals:Fire("Clicked")
        -- // As well as self.Signals:Fire("Changed", NewState, OldState)
        -- // Or use the self:Set state which handles this for you
    end

    -- // Updates the instance, reflecting any changes seen within the Data. This is fired whenever any changes are made with the Set method.
    function this.UpdateInstance(self)
        -- // Put your code here, no need for a return
    end

    -- // Hides the library
    function this.Hide(self)
        -- // Put your code here that hides the library
    end

    -- // Shows the library
    function this.Show(self)
        -- // Put your code here that shows the library
    end

    -- // Gets the current state
    function this.Get(self)
        return self.State
    end

    -- // Sets the current state
    function this.Set(self, NewState)
        local OldState = self.State

        if (NewState == nil) then
            NewState = not self.State
        end
        self.State = NewState

        self.Signals:Fire("Clicked")
        self.Signals:Fire("Changed", NewState, OldState)

        if (NewState) then
            this:Show()
        else
            this:Hide()
        end

        self.Callback(NewState, OldState)

        self:UpdateInstance()
    end

    -- // Loads default settings with given data
    function this.InitialiseSettings(self, Data)
        -- // Make sure we have data
        Data = Data or {}

        -- // Loop through defaults and set
        for i, v in pairs(this.DefaultSettings) do
            self[i] = Data[i] or v
        end

        -- // Return
        return self
    end

    -- // Creates all of the signals, ready to be fire and connected to
    function this.InitialiseSignals(self)
        -- // Loop through each signal
        for _, v in ipairs(this.AllSignals) do
            -- // Add it
            self.Signals:Add(v)
        end
    end

    -- // Adding all of the components, e.g. Tabs.
    for _, ElementComponent in ipairs(this.Components) do
        this[ElementComponent.__type] = function(self, Data)
            Data = Data or {}
            Data.Parent = self

            return ElementComponent.new(Data)
        end
    end
end

-- // Return
--getgenv().Library = Library -- // Used for testing purposes locally
return Library