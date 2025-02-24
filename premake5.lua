-- @file workspace Premake.
-- @brief Defines all Solutions Building.
-- @author Spices.

workspace "LearnOpenGL"
	architecture "x64"              -- Platform x64
	startproject "LearnOpenGL"      -- Start with LearnOpenGL

	-- Configuration: Debug and Release.
	configurations
	{
		"Debug",
		"Release",
	}

-- Building Output Folder.
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Libraries of this Solution.
include "lib.lua"

-- Project Dependencies.
group "Dependencies"
	include "vendor/GLFW/"           -- Dependency GLFW.
group ""

-- Project
project "LearnOpenGL"
	kind "ConsoleApp"           -- Use exe.
	language "C++"				-- Use C++.
	cppdialect "C++17"			-- Use C++17.
	staticruntime "On"			-- Use Runtime Linrary: MTD.

	-- Building Output Folder.
	targetdir("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")

	-- Building Object Folder.
	objdir("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	-- Enable Multi Processor Compile
	flags { "MultiProcessorCompile" }

	-- The Solution Files.
	files
	{
		-- Game Source Files.
		"src/**.h",
		"src/**.cpp",
	}

	-- Macros Definitions
	defines
	{
	}

	-- The Solution Additional Include Folder.
	includedirs
	{
		"src",                                                -- Source Folder.
		"%{IncludeDir.GLFW}",                                 -- Library: GLFW Source Folder.
	}

	-- Platform: Windows
	filter "system:windows"
		systemversion "latest"                 -- Use Lastest WindowSDK
		editAndContinue "Off"                  -- Use DebugInfoFormat: Zi (Program Database).

		-- Windows Specific Solution Macro Definitions.
		defines
		{
		}

	-- Configuration: Debug
	filter "configurations:Debug"

		-- Debug Specific Solution Macro Definitions.
		defines
		{
		}

		runtime "Debug"
		symbols "On"

	-- Configuration: Release.
	filter "configurations:Release"

		-- Release Specific Solution Macro Definitions.
		defines
		{
		}

		runtime "Release"
		optimize "On"