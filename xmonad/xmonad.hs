import XMonad
import XMonad.Actions.CycleWS      -- cycle thru WS', toggle last WS
import XMonad.Hooks.DynamicLog     -- statusbar 
import XMonad.Hooks.ManageDocks    -- dock/tray mgmt
import XMonad.Util.EZConfig        -- append key/mouse bindings
import XMonad.Util.Run(spawnPipe)  -- spawnPipe and hPutStrLn
import System.IO
import XMonad.Actions.SpawnOn

xmobarTitleColor = "#afb1d0"
xmobarCurrentTileColor = xmobarTitleColor
xmobarTileColor = "#686878"

myManageHook = composeAll
   []

myLogHook xmproc = dynamicLogWithPP $ xmobarPP
                       { ppOutput = hPutStrLn xmproc
                       , ppTitle = xmobarColor xmobarTitleColor "" . shorten 100
                       , ppCurrent = xmobarColor xmobarCurrentTileColor "" . wrap "(" ")"
                       , ppHidden = xmobarColor xmobarTileColor ""
                       }

myKeys = [ ("M-d", spawn "dmenu_run -p \"$\" -nb \"#000000\" -sb \"#d7d9fc\" -nf \"#f2f2f2\" -sf \"#000000\"" ) -- run dmenu program launcher
         , ("M-b", sendMessage ToggleStruts ) -- toggle the status bar gap
         , ("M-g", spawn "chromium"         ) -- launch chromium
         ]

myConfig xmproc = defaultConfig                                                  
        { manageHook = myManageHook                                
                       <+> manageDocks                        
                       <+> manageHook defaultConfig          
        , logHook            = myLogHook xmproc
	, layoutHook = avoidStruts  $  layoutHook defaultConfig
	, terminal   = "urxvt"
	, modMask    = mod4Mask
	, normalBorderColor  = "#000000"
	, focusedBorderColor = "#706580"
        , startupHook = return () >> checkKeymap (myConfig xmproc) myKeys
	, workspaces  = ["1", "2", "3", "4", "5"]
        }     
        `additionalKeysP` myKeys

main = do
    xmproc <- spawnPipe "/usr/bin/xmobar /home/seth/.xmobarrc"
    xmonad $ myConfig xmproc
