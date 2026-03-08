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

# Auto-detect theme from hostname
theme:
	@HOSTNAME=$$(cat /etc/hostname); \
	case $$HOSTNAME in \
		archlinux) theme="desktop" ;; \
		archlinux-btw) theme="laptop" ;; \
		*) echo "Unknown hostname: $$HOSTNAME"; exit 1 ;; \
	esac; \
	echo "Applying $$theme theme..."; \
	echo "source = ~/.config/hypr/themes/$$theme.conf" > ~/.config/hypr/hyprland.conf; \
	pkill waybar; nohup waybar -c ~/.config/waybar/themes/$$theme/config.jsonc -s ~/.config/waybar/themes/$$theme/style.css & \
	hyprctl reload
