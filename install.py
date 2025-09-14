import os
import sys

print("Let's install your config! (FOR ARCH ONLY!)")

print("# Installation Options")
print("[1] Complete Setup")
print("[2] Nvim Setup")

choice = input("Choose [1] [2] : ")

match choice:
    case "1":
        print("\n #Moving bashrc file")
        os.system("cp -r rcfiles/.bashrc ")

        print("\n# Installing packages")
        os.system("sudo pacman -S - < packages.txt")
        print("\nPackages installed successfully!")

        print("\n#Moving configs")
        os.system("cp -r configs/*/ ~/.config")
        print("Configs moved!")

    case "2":
        print("\n# Installing neovim")
        os.system("sudo pacman -S neovim")
        print("\nNeovim installed")
        print("\n Moving configs")
        os.system("cp -r configs/nvim ~/.config")
        print("\n Configs moved!")

    case _:
        print("Invalid, Please try again!")
        sys.exit()

print("\nInstallation Successfull!")
