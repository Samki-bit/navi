import os
import sys

print("Let's install your config!")

print("# Installation Options")
print("[1] Complete Setup")
print("[2] Nvim Setup")

choice = input("Choose [1] [2] : ")

match choice:
    case "1":
        print("\nhehe, its not done yet")

    case "2":
        print("\n# Installing neovim")
        os.system("sudo pacman -S neovim")
        print("\nNeovim installed")
        print("\n Moving configs")
        os.system("cp -r ~/navi/configs/nvim ~/.config")
        print("\n Configs moved!")

    case _:
        print("Invalid, Please try again!")
        sys.exit()

print("\nInstallation Successfull!")
