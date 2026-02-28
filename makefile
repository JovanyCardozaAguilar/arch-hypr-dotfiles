sync:
	cp -r ~/.config/hypr/themes ./hypr/
	cp ~/.config/hypr/hyprland.conf ./hypr/
	cp -r ~/.config/waybar/themes ./waybar/
	git add .
	git commit -m "updated configs"
	git push

install:
	cp -r ./hypr ~/.config/
	cp -r ./waybar ~/.config/
	pkill waybar; nohup waybar &
	hyprctl reload
theme:
	@echo "1) desktop"
	@echo "2) laptop"
	@read -p "Enter theme: " theme; \
	sed -i "s|source = .*|source = ~/.config/hypr/themes/$$theme.conf|" ~/.config/hypr/hyprland.conf; \
	pkill waybar; nohup waybar -c ~/.config/waybar/themes/$$theme/config.jsonc -s ~/.config/waybar/themes/$$theme/style.css &
	hyprctl reload
