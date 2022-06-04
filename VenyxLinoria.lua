--[[
    Venyx to Linoria

    Note: This is NOT functional and has been DISCONTINUED
]]

-- // Dependencies
local LinoriaLibrary
local VenyxLibrary

-- // Button class
local Button = {}
Button.__index = Button
do
    -- // Vars
    local this = Button
    local DefaultSettings = {
        _Library = "Linoria",

        Title = "New Button",
        Callback = function() end
    }

    -- // Constructor
    function this.new(Data)
        -- //
        Data = Data or {}

        -- // Create object
        local self = setmetatable({}, this)

        -- // Vars
        self:InitialiseSettings(Data)
        assert(self.Groupbox, "Groupbox not supplied")

        -- // Create the UI Library object
        self.Object = self:CreateObject()

        -- // Return object
        return self
    end

    -- // Creates the actual object
    function this.CreateObject(self)
        -- // Linoria
        if (self._Library == "Linoria") then
            return self.Groupbox:AddButton(self.Title, self.Callback)
        end

        -- // Venyx
        return self.Groupbox:addButton({
            title = self.Title,
            callback = self.Callback
        })
    end

    -- // Loads default settings with given data
    function this.InitialiseSettings(self, Data)
        -- // Loop through defaults and set
        for i, v in pairs(DefaultSettings) do
            self[i] = Data[i] or v
        end

        -- // Return
        return self
    end
end

-- // Toggle class
local Toggle = {}
Toggle.__index = Toggle
do
    -- // Vars
    local this = Toggle
    local DefaultSettings = {
        _Library = "Linoria",

        Title = "New Toggle",
        Default = nil,
        Tooltip = nil,
        Flag = tostring(math.random()),
        Callback = function() end
    }

    -- // Constructor
    function this.new(Data)
        -- //
        Data = Data or {}

        -- // Create object
        local self = setmetatable({}, this)

        -- // Vars
        self:InitialiseSettings(Data)
        assert(self.Groupbox, "Groupbox not supplied")

        -- // Create the UI Library object
        self.Object = self:CreateObject()

        -- // Return object
        return self
    end

    -- // Creates the actual object
    function this.CreateObject(self)
        -- // Linoria
        if (self._Library == "Linoria") then
            -- // Creating the object
            local Object = self.Groupbox:AddToggle(self.Flag, {
                Text = self.Title,
                Default = self.Default,
                Tooltip = self.Tooltip
            })

            -- // Then the listener
            Object:OnChanged(function()
                self.Callback(Object.Value)
            end)

            -- //
            return Object
        end

        -- // Venyx
        return self.Groupbox:addToggle({
            title = self.Title,
            default = self.Default,
            callback = self.Callback
        })
    end

    -- // Loads default settings with given data
    function this.InitialiseSettings(self, Data)
        -- // Loop through defaults and set
        for i, v in pairs(DefaultSettings) do
            self[i] = Data[i] or v
        end

        -- // Return
        return self
    end
end

-- // Textbox class
local Textbox = {}
Textbox.__index = Textbox
do
    -- // Vars
    local this = Textbox
    local DefaultSettings = {
        _Library = "Linoria",

        Title = "New Toggle",
        Default = nil,
        Tooltip = nil,
        Flag = tostring(math.random()),
        Callback = function() end
    }

    -- // Constructor
    function this.new(Data)
        -- //
        Data = Data or {}

        -- // Create object
        local self = setmetatable({}, this)

        -- // Vars
        self:InitialiseSettings(Data)
        assert(self.Groupbox, "Groupbox not supplied")

        -- // Create the UI Library object
        self.Object = self:CreateObject()

        -- // Return object
        return self
    end

    -- // Creates the actual object
    function this.CreateObject(self)
        -- // Linoria
        if (self._Library == "Linoria") then
            -- // Creating the object
            local NewToggle = self.Groupbox:AddToggle(self.Flag, {
                Text = self.Title,
                Default = self.Default,
                Tooltip = self.Tooltip
            })

            -- // Then the listener
            NewToggle:OnChanged(function()
                self.Callback(NewToggle.Value)
            end)
        end

        -- // Venyx
        return self.Groupbox:addToggle({
            title = self.Title,
            default = self.Default,
            callback = self.Callback
        })
    end

    -- // Loads default settings with given data
    function this.InitialiseSettings(self, Data)
        -- // Loop through defaults and set
        for i, v in pairs(DefaultSettings) do
            self[i] = Data[i] or v
        end

        -- // Return
        return self
    end
end

-- // Keybind class
local Keybind = {}
Keybind.__index = Keybind
do
    -- // Vars
    local this = Keybind
    local DefaultSettings = {
        _Library = "Linoria",

        Title = "New Keybind",
        Title2 = "idk",
        Default = nil,
        SyncToggleState = false,
        Mode = "Toggle",
        Text = "idk",
        NoUI = false,
        Tooltip = nil,
        Flag = tostring(math.random()),
        Callback = function() end,
        ChangedCallback = function() end
    }

    -- // Constructor
    function this.new(Data)
        -- //
        Data = Data or {}

        -- // Create object
        local self = setmetatable({}, this)

        -- // Vars
        self:InitialiseSettings(Data)
        assert(self.Groupbox, "Groupbox not supplied")

        -- // Create the UI Library object
        self.Object = self:CreateObject()

        -- // Return object
        return self
    end

    -- // Creates the actual object
    function this.CreateObject(self)
        -- // Linoria
        if (self._Library == "Linoria") then
            -- // Creating the object
            local NewKeybind = self.Groupbox:AddLabel(self.Title2):AddKeyPicker(self.Title, self)

            -- // Then the listener
            NewKeybind:OnClick(function()
                self.Callback(NewKeybind.Value)
            end)
        end

        -- // Venyx
        return self.Groupbox:addKeybind({
            title = self.Title,
            key = self.Default,
            callback = self.Callback,
            changedCallback = self.ChangedCallback
        })
    end

    -- // Loads default settings with given data
    function this.InitialiseSettings(self, Data)
        -- // Loop through defaults and set
        for i, v in pairs(DefaultSettings) do
            self[i] = Data[i] or v
        end

        -- // Return
        return self
    end
end

-- // Color Picker class
local ColorPicker = {}
ColorPicker.__index = ColorPicker
do
    -- // Vars
    local this = ColorPicker
    local DefaultSettings = {
        _Library = "Linoria",

        Title = "New Toggle",
        Default = nil,
        Tooltip = nil,
        Flag = tostring(math.random()),
        Callback = function() end
    }

    -- // Constructor
    function this.new(Data)
        -- //
        Data = Data or {}

        -- // Create object
        local self = setmetatable({}, this)

        -- // Vars
        self:InitialiseSettings(Data)
        assert(self.Groupbox, "Groupbox not supplied")

        -- // Create the UI Library object
        self.Object = self:CreateObject()

        -- // Return object
        return self
    end

    -- // Creates the actual object
    function this.CreateObject(self)
        -- // Linoria
        if (self._Library == "Linoria") then
            -- // Creating the object
            local NewToggle = self.Groupbox:AddToggle(self.Flag, {
                Text = self.Title,
                Default = self.Default,
                Tooltip = self.Tooltip
            })

            -- // Then the listener
            NewToggle:OnChanged(function()
                self.Callback(NewToggle.Value)
            end)
        end

        -- // Venyx
        return self.Groupbox:addToggle({
            title = self.Title,
            default = self.Default,
            callback = self.Callback
        })
    end

    -- // Loads default settings with given data
    function this.InitialiseSettings(self, Data)
        -- // Loop through defaults and set
        for i, v in pairs(DefaultSettings) do
            self[i] = Data[i] or v
        end

        -- // Return
        return self
    end
end

-- // Slider class
local Slider = {}
Slider.__index = Slider
do
    -- // Vars
    local this = Slider
    local DefaultSettings = {
        _Library = "Linoria",

        Title = "New Slider",
        Default = 0,
        Min = 0,
        Max = 5,
        Rounding = 1,
        Compact = false,
        Flag = tostring(math.random()),
        Callback = function() end
    }

    -- // Constructor
    function this.new(Data)
        -- //
        Data = Data or {}

        -- // Create object
        local self = setmetatable({}, this)

        -- // Vars
        self:InitialiseSettings(Data)
        assert(self.Groupbox, "Groupbox not supplied")

        -- // Create the UI Library object
        self.Object = self:CreateObject()

        -- // Return object
        return self
    end

    -- // Creates the actual object
    function this.CreateObject(self)
        -- // Linoria
        if (self._Library == "Linoria") then
            -- // Creating the object
            local Object = self.Groupbox:AddSlider(self.Flag, self)

            -- // Then the listener
            Object:OnChanged(function()
                self.Callback(Object.Value)
            end)

            -- //
            return Object
        end

        -- // Venyx
        return self.Groupbox:addSlider({
            title = self.Title,
            min = self.Min,
            default = self.Default,
            max = self.Max,
            precision = self.Rounding,
            callback = self.Callback
        })
    end

    -- // Loads default settings with given data
    function this.InitialiseSettings(self, Data)
        -- // Loop through defaults and set
        for i, v in pairs(DefaultSettings) do
            self[i] = Data[i] or v
        end

        -- // Return
        return self
    end
end

-- // Dropbox class
local Dropbox = {}
Dropbox.__index = Dropbox
do
    -- // Vars
    local this = Dropbox
    local DefaultSettings = {
        _Library = "Linoria",

        Title = "New Dropbox",
        Default = 1,
        Values = {},
        BackupValues = {},
        Tooltip = nil,
        Flag = tostring(math.random()),
        Callback = function() end
    }

    -- // Constructor
    function this.new(Data)
        -- //
        Data = Data or {}

        -- // Create object
        local self = setmetatable({}, this)

        -- // Vars
        self:InitialiseSettings(Data)
        assert(self.Groupbox, "Groupbox not supplied")

        -- // Create the UI Library object
        self.Object = self:CreateObject()

        -- // Return object
        return self
    end

    -- // Creates the actual object
    function this.CreateObject(self)
        -- // Linoria
        if (self._Library == "Linoria") then
            -- // Creating the object
            local Object = self.Groupbox:AddDropdown(self.Flag, self)

            -- // Then the listener
            Object:OnChanged(function()
                self.Callback(Object.Value)
            end)

            -- //
            return Object
        end

        -- // Venyx
        return self.Groupbox:addDropdown({
            title = self.Title,
            list = self.Values,
            backuplist = self.Values,
            default = self.Default,
            callback = self.Callback
        })
    end

    -- // Loads default settings with given data
    function this.InitialiseSettings(self, Data)
        -- // Loop through defaults and set
        for i, v in pairs(DefaultSettings) do
            self[i] = Data[i] or v
        end

        -- // Return
        return self
    end
end

-- // Groupboxes
local Groupbox = {}
Groupbox.__index = Groupbox
do
    -- // Vars
    local this = Groupbox
    local DefaultSettings = {
        _Library = "Linoria",

        Title = "New Groupbox",
        Side = ""
    }

    -- // Constructor
    function this.new(Data)
        -- //
        Data = Data or {}

        -- // Create object
        local self = setmetatable({}, this)

        -- // Vars
        self:InitialiseSettings(Data)
        assert(self.Tab, "Tab not supplied")

        -- // Create the UI Library object
        self.Object = self:CreateObject()

        -- // Return object
        return self
    end

    -- // Creates the actual object
    function this.CreateObject(self)
        -- // Linoria
        if (self._Library == "Linoria") then
            -- // Vars
            local LoweredSide = self.Side:lower()

            -- // Sided boxes
            if (LoweredSide == "left") then
                return self.Tab:AddLeftGroupbox(self.Title)
            elseif (LoweredSide == "right") then
                return self.Tab:AddRightGroupbox(self.Title)
            end

            -- //
            error("Invalid side")
        end

        -- // Venyx
        return self.Tab:addSection({
            title = self.Title
        })
    end

    -- // Loads default settings with given data
    function this.InitialiseSettings(self, Data)
        -- // Loop through defaults and set
        for i, v in pairs(DefaultSettings) do
            self[i] = Data[i] or v
        end

        -- // Return
        return self
    end
end

-- // Tabs
local Tab = {}
Tab.__index = Tab
do
    -- // Vars
    local this = Tab
    local DefaultSettings = {
        _Library = "Linoria",

        Title = "New Tab",
        Icon = ""
    }

    -- // Constructor
    function this.new(Data)
        -- //
        Data = Data or {}

        -- // Create object
        local self = setmetatable({}, this)

        -- // Vars
        self:InitialiseSettings(Data)
        assert(self.Library, "Library not supplied")

        -- // Create the UI Library object
        self.Object = self:CreateObject()

        -- // Return object
        return self
    end

    -- // Creates the actual object
    function this.CreateObject(self)
        -- // Linoria
        if (self._Library == "Linoria") then
            return self.Library:AddTab(self.Title)
        end

        -- // Venyx
        return self.Library:addPage({
            title = self.Title,
            icon = self.Icon
        })
    end

    -- // Loads default settings with given data
    function this.InitialiseSettings(self, Data)
        -- // Loop through defaults and set
        for i, v in pairs(DefaultSettings) do
            self[i] = Data[i] or v
        end

        -- // Return
        return self
    end
end

-- // Main Library
local Library = {}
Library.__index = Library
do
    -- // Vars
    local this = Library
    local DefaultSettings = {
        _Library = "Linoria",

        Title = "Library",
        Center = true,
        AutoShow = true
    }

    -- // Constructor
    function this.new(Data)
        -- //
        Data = Data or {}

        -- // Create object
        local self = setmetatable({}, this)

        -- // Vars
        self:InitialiseSettings(Data)

        -- // Create the UI Library object
        self.Object = self._Library == "Linoria" and LinoriaLibrary:CreateWindow(self) or VenyxLibrary.new(self)

        -- // Return object
        return self
    end

    -- // Creates the actual object
    function this.CreateObject(self)
        -- // Linoria
        if (self._Library == "Linoria") then
            return LinoriaLibrary:CreateWindow(self)
        end

        -- // Venyx
        return VenyxLibrary.new(self)
    end

    -- // Loads default settings with given data
    function this.InitialiseSettings(self, Data)
        -- // Loop through defaults and set
        for i, v in pairs(DefaultSettings) do
            self[i] = Data[i] or v
        end

        -- // Return
        return self
    end
end