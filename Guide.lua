--[[
    UI Library Guide

    Information:
        - This guide uses International (British) English spelling so please abide by that

    To Do:
        - Type Checking
        - Add additional components
        - Add additional methods like ChangeTitle, etc.
]]

-- // Dependencies
local SignalManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stefanuk12/Signal/main/Manager.lua"))()

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
        Toggle
    }
end

-- // Tab class - all state related things are in reference to the Tab's visibility
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