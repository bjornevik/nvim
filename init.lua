--[[
    ____      ______  ____  _   _________    ________ __
   / __ )    / / __ \/ __ \/ | / / ____/ |  / /  _/ //_/
  / __  |_  / / / / / /_/ /  |/ / __/  | | / // // ,<
 / /_/ / /_/ / /_/ / _, _/ /|  / /___  | |/ // // /| |
/_____/\____/\____/_/ |_/_/ |_/_____/  |___/___/_/ |_|

This configuration runs on Neovim Nightly

It uses the wbthomason/packer.nvim package manager.

* the lua/plugins.lua file contains the code for the packer.nvim package manager
* the lua/defaults/ dir contains my basic neovim options.
* the lua/bjornevik/ dir contains all specialized setup with regards to plugins etc.

I use <space> as my leader key.
--]]
vim.g.mapleader = " "

pcall(require, "impatient")

require "plugins"
require "defaults"
require "bjornevik"
