# Push config changes to git repo
upload:
	cp -r ~/.config/hypr/themes ./hypr/
	cp ~/.config/hypr/hyprland.conf ./hypr/
	cp -r ~/.config/waybar/themes ./waybar/
	git add .
	git commit -m "updated configs"
	git push

# Install config changes from git repo
install:
	git fetch
	git pull
	cp -r ./hypr ~/.config/
	cp -r ./waybar ~/.config/
	pkill waybar; nohup waybar &
	hyprctl reload

# Choose theme
theme:
	@echo "1) desktop"
	@echo "2) laptop"
	@read -p "Enter theme: " theme; \
	case $$theme in \
		1) theme="desktop" ;; \
		2) theme="laptop" ;; \
	esac; \
	echo "source = ~/.config/hypr/themes/$$theme.conf" > ~/.config/hypr/hyprland.conf; \
	pkill waybar; nohup waybar -c ~/.config/waybar/themes/$$theme/config.jsonc -s ~/.config/waybar/themes/$$theme/style.css &
	hyprctl reload
