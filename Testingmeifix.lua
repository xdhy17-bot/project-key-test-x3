local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1

-- ==========================================
-- 🛡️ SISTEM EXPIRY & BAN POPUP (X3TeamID)
-- ==========================================
local __X3MOD_EXP_CFG = {
    year = 2026, month = 5, day = 22,
    hour = 0, min = 0, sec = 0
}
local __X3MOD_EXP_TS = os.time(__X3MOD_EXP_CFG)
local __X3MOD_SHOWN = false
local __X3MOD_DEBUG = false  -- ⚠️ Ubah ke true HANYA untuk test popup

local function __X3MOD_ShowBan()
    if __X3MOD_SHOWN then return end
    __X3MOD_SHOWN = true
    pcall(function()
        local MsgBox = require("client.slua.logic.common.logic_common_msg_box")
        if not MsgBox then return end
        
        local uid = 0
        pcall(function() uid = DataMgr and DataMgr.roleData and DataMgr.roleData.uid or 0 end)
        
        local dateStr = "22 Mei 2026 00:00"
        pcall(function()
            local TU = require("client.common.time_util")
            if TU and TU.FormatTime_YMDHMS then
                dateStr = TU.FormatTime_YMDHMS(3834709993, true)
            end
        end)
        
        local banInfo = "Sudah Expired TOLOLL !! .\nJoin Channel @X3TeamID || Order Vip PM Telegram @X3itsmegp & @estelerbang !"
        local msg = "UID: " .. tostring(uid) .. "\n\nMasa berlaku mod telah habis.\n" .. banInfo
        local title = "X3Team Mod Expired"
        
        local function forceQuit()
            pcall(function()
                local LM = ModuleManager and ModuleManager.GetModule and ModuleManager.LobbyModuleConfig
                if LM and LM.login_module and LM.login_module.backLogin then
                    LM.login_module:backLogin("expired")
                else
                    slua.consoleCommand("quit")
                end
            end)
        end
        
        pcall(function()
            MsgBox.Show(2, title, msg, forceQuit, forceQuit, "OK", "Tutup", {
                showUIKey = "com_msg_box_5s",
                autoCloseTime = 150,
                autoCloseWithoutCallback = true,
                hideAutoCloseRemainTime = true,
                onTimerInvoke = forceQuit
            })
        end)
    end)
end

local function __X3MOD_Check()
    if __X3MOD_DEBUG then
        __X3MOD_ShowBan()
        return true
    end
    if os.time() > __X3MOD_EXP_TS then
        __X3MOD_ShowBan()
        return true
    end
    return false
end
-- ==========================================

L0_1 = _G
L0_1.AKMOD_WARNING = "AKMOD_ANTI_REVERSE_ENGINEERING_FUCK_YOU"

L0_1 = require
L1_1 = "class"
L0_1 = L0_1(L1_1)
L1_1 = require
L2_1 = "GameLua.GameCore.Framework.CharacterBase"
L1_1 = L1_1(L2_1)
L2_1 = require
L3_1 = "combine_class"
L2_1 = L2_1(L3_1)
L3_1 = require
L4_1 = "GameLua.GameCore.Data.GameplayData"
L3_1 = L3_1(L4_1)
L4_1 = require
L5_1 = "client.slua.logic.setting.setting_util"
L4_1 = L4_1(L5_1)
L5_1 = require
L6_1 = "GameLua.Mod.BaseMod.Common.Security.SecurityCommonUtils"
L5_1 = L5_1(L6_1)
L6_1 = require
L7_1 = "client.slua.logic.common.logic_common_legal_msg"
L6_1 = L6_1(L7_1)
L7_1 = require
L8_1 = "common.time_ticker"
L7_1 = L7_1(L8_1)
L8_1 = require
L9_1 = "GameLua.Mod.BaseMod.Common.InGameMarkTools"
L8_1 = L8_1(L9_1)

function L9_1()
  local L0_2, L1_2
end

function L10_1()
  local L0_2, L1_2
  L0_2 = _G
  L0_2 = L0_2.AKModBypassInitialized
  if L0_2 then
    return
  end
  L0_2 = pcall
  
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = _G
    L0_3 = L0_3.GameplayCallbacks
    if not L0_3 then
      L0_3 = _G
      L0_3 = L0_3.GC
    end
    if L0_3 then
      L1_3 = L9_1
      L0_3.SendTssSdkAntiDataToLobby = L1_3
      L1_3 = L9_1
      L0_3.SendDSErrorLogToLobby = L1_3
      L1_3 = L9_1
      L0_3.SendDSHawkEyePatrolLogToLobby = L1_3
      L1_3 = L9_1
      L0_3.SendSecTLog = L1_3
      L1_3 = L9_1
      L0_3.SendDataMiningTLog = L1_3
      L1_3 = L9_1
      L0_3.SendActivityTLog = L1_3
    end
    L1_3 = require
    L2_3 = "GameLua.GameCore.Module.Subsystem.SubsystemMgr"
    L1_3 = L1_3(L2_3)
    if L1_3 then
      L3_3 = L1_3
      L2_3 = L1_3.Get
      L4_3 = "DSHawkEyePatrolSubsystem"
      L2_3 = L2_3(L3_3, L4_3)
      if L2_3 then
        L3_3 = L9_1
        L2_3.MarkSuspiciousPlayer = L3_3
      end
    end
    L2_3 = package
    L2_3 = L2_3.loaded
    L2_3 = L2_3["GameLua.Mod.BaseMod.Client.Security.ClientReportPlayerSubsystem"]
    if not L2_3 then
      L2_3 = require
      L3_3 = "GameLua.Mod.BaseMod.Client.Security.ClientReportPlayerSubsystem"
      L2_3 = L2_3(L3_3)
    end
    if L2_3 then
      L3_3 = L9_1
      L2_3.OnInit = L3_3
      L3_3 = L9_1
      L2_3._OnPlayerKilledOtherPlayer = L3_3
      L3_3 = L9_1
      L2_3._RecordFatalDamager = L3_3
      L3_3 = L9_1
      L2_3._OnBattleResult = L3_3
    end
    L3_3 = package
    L3_3 = L3_3.loaded
    L3_3 = L3_3["GameLua.Mod.BaseMod.DS.Security.DSReportPlayerSubsystem"]
    if not L3_3 then
      L3_3 = require
      L4_3 = "GameLua.Mod.BaseMod.DS.Security.DSReportPlayerSubsystem"
      L3_3 = L3_3(L4_3)
    end
    if L3_3 then
      L4_3 = L9_1
      L3_3.OnInit = L4_3
      L4_3 = L9_1
      L3_3._OnCharacterDied = L4_3
      L4_3 = L9_1
      L3_3._RecordFatalDamager = L4_3
    end
    L4_3 = pcall
    
    function L5_3()
      local L0_4, L1_4, L2_4, L3_4
      L0_4 = package
      L0_4 = L0_4.loaded
      L0_4 = L0_4["GameLua.Mod.BaseMod.Common.Security.HiggsBosonComponent"]
      if not L0_4 then
        L1_4 = pcall
        L2_4 = require
        L3_4 = "GameLua.Mod.BaseMod.Common.Security.HiggsBosonComponent"
        L1_4, L2_4 = L1_4(L2_4, L3_4)
        if L1_4 then
          L0_4 = L2_4
        end
      end
      if L0_4 then
        L1_4 = L9_1
        L0_4.ControlMHActive = L1_4
        L1_4 = L9_1
        L0_4.Tick = L1_4
        L1_4 = L9_1
        L0_4.OnTick = L1_4
        L1_4 = L9_1
        L0_4.ReceiveTick = L1_4
        L1_4 = L9_1
        L0_4.MHActiveLogic = L1_4
        L1_4 = L9_1
        L0_4.TriggerAvatarCheck = L1_4
        L1_4 = L9_1
        L0_4.StartAvatarCheck = L1_4
        L1_4 = L9_1
        L0_4.ReportItemID = L1_4
        L1_4 = L9_1
        L0_4.OnReportItemID = L1_4
        L1_4 = L9_1
        L0_4.ReceiveAnyDamage = L1_4
        L1_4 = L9_1
        L0_4.OnWeaponHitRecord = L1_4
        L1_4 = L9_1
        L0_4.ShowSecurityAlert = L1_4
        
        function L1_4()
          local L0_5, L1_5
          L0_5 = {}
          return L0_5
        end
        
        L0_4.GetNetAvatarItemIDs = L1_4
        
        function L1_4()
          local L0_5, L1_5
          L0_5 = 0
          return L0_5
        end
        
        L0_4.GetCurWeaponSkinID = L1_4
        L1_4 = L0_4.StaticShowSecurityAlertInDev
        if L1_4 then
          L1_4 = L9_1
          L0_4.StaticShowSecurityAlertInDev = L1_4
        end
      end
      L1_4 = _G
      L1_4 = L1_4.AvatarCheckCallback
      if L1_4 then
        L1_4 = _G
        L1_4 = L1_4.AvatarCheckCallback
        L2_4 = L9_1
        L1_4.StartAvatarCheck = L2_4
        L1_4 = _G
        L1_4 = L1_4.AvatarCheckCallback
        L2_4 = L9_1
        L1_4.OnReportItemID = L2_4
        L1_4 = _G
        L1_4 = L1_4.AvatarCheckCallback
        
        function L2_4(A0_5)
          local L1_5, L2_5
          L1_5 = slua
          L1_5 = L1_5.isValid
          L2_5 = A0_5
          L1_5 = L1_5(L2_5)
          if L1_5 then
            L1_5 = A0_5.HiggsBosonComponent
            if L1_5 then
              L1_5 = pcall
              
              function L2_5()
                local L0_6, L1_6, L2_6
                L0_6 = A0_5.HiggsBosonComponent
                L1_6 = L0_6
                L0_6 = L0_6.ControlMHActive
                L2_6 = 0
                L0_6(L1_6, L2_6)
                L0_6 = A0_5.HiggsBosonComponent
                L0_6.bMHActive = false
              end
              
              L1_5(L2_5)
            end
          end
        end
        
        L1_4.PostPlayerControllerLoginInit = L2_4
      end
      L1_4 = _G
      L1_4 = L1_4.DisableHiggsBoson
      if L1_4 then
        L1_4 = _G
        L1_4 = L1_4.DisableHiggsBoson
        L2_4 = _G
        
        function L3_4()
          local L0_5, L1_5
          L0_5 = pcall
          L1_5 = L1_4
          L0_5(L1_5)
        end
        
        L2_4.DisableHiggsBoson = L3_4
      else
      end
    end
    
    L4_3(L5_3)
    if L0_3 then
      L4_3 = L0_3.OnDSPlayerStateChanged
      
      function L5_3(A0_4, A1_4, A2_4, ...)
        local L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4
        L3_4 = {}
        L3_4.cheatdetected = true
        L3_4.connectionlost = true
        L3_4.connectiontimeout = true
        L3_4.netdrivererror = true
        L4_4 = tostring
        L5_4 = A2_4
        L4_4 = L4_4(L5_4)
        L5_4 = L4_4
        L4_4 = L4_4.lower
        L4_4 = L4_4(L5_4)
        L4_4 = L3_4[L4_4]
        if L4_4 then
          return
        end
        L4_4 = L4_3
        if L4_4 then
          L4_4 = pcall
          L5_4 = L4_3
          L6_4 = A0_4
          L7_4 = A1_4
          L8_4 = A2_4
          L9_4 = ...
          L4_4(L5_4, L6_4, L7_4, L8_4, L9_4)
        end
      end
      
      L0_3.OnDSPlayerStateChanged = L5_3
      L5_3 = L9_1
      L0_3.OnPlayerRPCValidateFailed = L5_3
      L5_3 = L9_1
      L0_3.OnPlayerActorChannelError = L5_3
      L5_3 = L9_1
      L0_3.OnPlayerSpectateException = L5_3
      L5_3 = L9_1
      L0_3.OnShutdownAfterError = L5_3
      L5_3 = L9_1
      L0_3.OnPlayerNetConnectionClosed = L5_3
    else
    end
    L4_3 = _G
    L4_3.AKModBypassInitialized = true
  end
  
  L0_2(L1_2)
end

L11_1 = L10_1
L11_1()

-- 🟦 TEMPEL KODE BARU X3TeamID DI SINI (JANGAN HAPUS KODE LAMA)
pcall(function()
    -- 1. UI LOBBY & INGAME
    local LobbyUI = require("client.slua.umg.lobby.Main.Lobby_Main_Wifi_UIBP")
    if LobbyUI and LobbyUI.__inner_impl then
        local oldQ = LobbyUI.__inner_impl.UpdateQuality
        LobbyUI.__inner_impl.UpdateQuality = function(self)
            if oldQ then oldQ(self) end
            if self and self.UIRoot then
                self.UIRoot.WidgetSwitcher_Quality:SetActiveWidgetIndex(0)
                self.UIRoot.TextBlock_High:SetText("X3TeamID-KING")
                self.UIRoot.TextBlock_High:SetColorAndOpacity(FSlateColor(FLinearColor(1,1,1,1)))
            end
        end
    end

    local PhoneUI = require("GameLua.Mod.Library.Client.UI.IngamePhoneStateUI")
    if PhoneUI and PhoneUI.__inner_impl then
        local oldArt = PhoneUI.__inner_impl.UpdateArtQualityUI
        PhoneUI.__inner_impl.UpdateArtQualityUI = function(self, _, _)
            if oldArt then oldArt(self, _, _) end
            if self and self.UIRoot then
                self.UIRoot.TextBlock_quality:SetText("TG - @X3TeamID")
                self.UIRoot.TextBlock_quality:SetColorAndOpacity(FSlateColor(FLinearColor(0.0, 0.5, 1.0, 1.0)))
            end
        end
    end

    -- 2. LEVEL SPOOF
    if DataMgr and DataMgr.roleData then
        DataMgr.roleData.level = 77
        pcall(function() require("client.slua.event.EventSystem"):postEvent(1, 10501) end)
    end

    -- 3. FPS UNLOCK 165
    local logic_gfx = require("client.slua.logic.setting.logic_setting_graphics")
    local GfxDB     = require("client.slua.umg.NewSetting.GraphicsNew.GraphicSettingDB")
    if logic_gfx and GfxDB then
        local oldFPS = logic_gfx.SetFPS
        logic_gfx.SetFPS = function(gi, lvl)
            if lvl == 8 then GfxDB:UpdateUIData(GfxDB.FPSFineTuneSwitch, true) end
            if oldFPS then oldFPS(gi, lvl) end
            if lvl == 8 then
                local ft = GfxDB:GetUIData(GfxDB.FPSFineTuneNum)
                if ft and ft > 120 and gi then
                    gi:ExecuteCMD("t.MaxFPS", tostring(ft))
                    gi:ExecuteCMD("r.FrameRateLimit", tostring(ft))
                end
            end
        end
        GfxDB:UpdateUIData(GfxDB.FPSFineTuneSwitch, true)
        GfxDB:UpdateUIData(GfxDB.FPSFineTuneNum, 165)
        local gi = logic_gfx.GetGameInstance and logic_gfx.GetGameInstance()
        if gi then
            gi:ExecuteCMD("t.MaxFPS", "165")
            gi:ExecuteCMD("r.FrameRateLimit", "165")
        end
    end

    -- 4. ANTI-SPECTATOR
    local HawkEye = require("GameLua.Mod.BaseMod.DS.Security.DSHawkEyePatrolSubsystem")
    if HawkEye then
        function HawkEye:_OnSyncInspectorBroadcastCount(_, __, uSpec)
            if not slua.isValid(uSpec) then return end
            local pc = uSpec:GetOwner()
            if not slua.isValid(pc) then return end
            local uid = pc.UID
            local RTB = require("GameLua.Mod.BaseMod.Common.RealTimeBan.RealTimeBan")
            local cnt = RTB and RTB.GetUIDInspectorBroadcastCount(uid) or 0
            if cnt >= 0 and uSpec.ClientRPC_SyncInspectorBroadcastCount then
                uSpec:ClientRPC_SyncInspectorBroadcastCount(cnt, false)
            end
        end
    end

    -- 5. HEALTH ESP (Realtime 0.1 Detik)
    local function StartHealthESP()
        local STExtra = import("STExtraGameplayStatics")
        if not STExtra then return end
        local function Loop()
            pcall(function()
                local myPawn = Game and Game.GetPlayerCharacter and Game.GetPlayerCharacter()
                if not slua.isValid(myPawn) then return end
                local myTeam = myPawn.TeamID or -1
                local myLoc  = myPawn:K2_GetActorLocation()
                local allP   = Game.GetAllPlayerPawns and Game.GetAllPlayerPawns() or {}
                for _, p in pairs(allP) do
                    if slua.isValid(p) and p.TeamID ~= myTeam then
                        local pLoc = p:K2_GetActorLocation()
                        if FVector.Dist2D(myLoc, pLoc) < 40000 then
                            local hp = p.Health or 0
                            local mx = p.HealthMax or 100
                            local r  = math.max(0, math.min(1, hp/mx))
                            local bZ = pLoc.Z + 110
                            local bgS = FVector(pLoc.X, pLoc.Y-50, bZ)
                            local bgE = FVector(pLoc.X, pLoc.Y+50, bZ)
                            local hpS = FVector(pLoc.X, pLoc.Y-50, bZ)
                            local hpE = FVector(pLoc.X, pLoc.Y-50+(100*r), bZ)
                            local col = FLinearColor(0,1,0,1)
                            if r<=0.7 and r>0.3 then col=FLinearColor(1,1,0,1)
                            elseif r<=0.3 then col=FLinearColor(1,0,0,1) end
                            STExtra.ClientDrawDebugArrow(bgS, bgE, 0, FLinearColor(0.15,0.15,0.15,0.8), 0.12, 4)
                            STExtra.ClientDrawDebugArrow(hpS, hpE, 0, col, 0.12, 4)
                            STExtra.ClientDrawDebugArrow(FVector(pLoc.X,pLoc.Y,pLoc.Z+1000), FVector(pLoc.X,pLoc.Y,bZ+5), 10, FLinearColor(1,0,0,1), 0.12, 1.5)
                        end
                    end
                end
            end)
            if slua.setTimeout then slua.setTimeout(Loop, 100)
            else pcall(function() require("common.time_ticker").add("X3HP", 0.1, true, Loop) end) end
        end
        Loop()
    end
    StartHealthESP()
end)
-- 🟦 BATAS AKHIR KODE BARU

-- ⛔ Expiry lama dinonaktifkan agar tidak bentrok dengan sistem __X3MOD_Check()
-- L11_1 = {}
-- L11_1.year = 2026
L12_1 = __X3MOD_EXP_TS  -- ✅ Redirect ke timestamp sistem baru
L13_1 = {}
L14_1 = {}
L15_1 = {}
L15_1.Reliable = true
L16_1 = {}
L15_1.Params = L16_1
L14_1.ServerRPC_NearDeathGiveupRescue = L15_1
L15_1 = {}
L15_1.Reliable = true
L16_1 = {}
L17_1 = UEnums
L17_1 = L17_1.EPropertyClass
L17_1 = L17_1.Object
L16_1[1] = L17_1
L15_1.Params = L16_1
L14_1.ServerRPC_CarryDeadBox = L15_1
L15_1 = {}
L15_1.Reliable = true
L16_1 = {}
L17_1 = UEnums
L17_1 = L17_1.EPropertyClass
L17_1 = L17_1.Int
L16_1[1] = L17_1
L15_1.Params = L16_1
L14_1.RPC_Server_GmPlayAction = L15_1
L13_1.ServerRPC = L14_1
L14_1 = {}
L15_1 = {}
L15_1.Reliable = true
L16_1 = {}
L17_1 = UEnums
L17_1 = L17_1.EPropertyClass
L17_1 = L17_1.Int
L16_1[1] = L17_1
L15_1.Params = L16_1
L14_1.MulticastRPC_GmPlayAction = L15_1
L13_1.MulticastRPC = L14_1
L14_1 = {}
L15_1 = {}
L15_1.Reliable = true
L16_1 = {}
L17_1 = UEnums
L17_1 = L17_1.EPropertyClass
L17_1 = L17_1.Bool
L16_1[1] = L17_1
L15_1.Params = L16_1
L14_1.RPC_Client_SetShouldCheckPassWall = L15_1
L13_1.ClientRPC = L14_1

function L14_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = _G
  L0_2 = L0_2.LegalShown
  if L0_2 then
    return
  end
  L0_2 = _G
  L0_2.LegalShown = true
  L0_2 = {}
  L0_2[1] = "            !! Expired 22 Mei 2026 !!  "
  L0_2[2] = "           Loaded Lua Paks XTeamID "
  L0_2[3] = "                 Lua Paks By X3 "
  L0_2[4] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  L0_2[5] = "           Join Channel @X3TeamID"
  L0_2[6] = "            Order VIP PM Telegram:"
  L0_2[7] = "         @X3itsmegp & @estelerbang"
  L0_2[8] = "           WA: +6285242638495"

  L1_2 = L6_1.ShowOnePopUI
  L2_2 = {}
  L2_2.tabType = 600
  L2_2.title = " X3TeamID Official "
  L3_2 = table.concat(L0_2, "\n")
  L2_2.content = L3_2
  L2_2.btnOKText = "OK"
  L2_2.btnCancleText = " Join Telegram"
  
  -- 📏 Parameter Ukuran Besar & Posisi Tengah
  L2_2.width = 550
  L2_2.height = 480
  L2_2.align = 1
  L2_2.isCenter = true
  L2_2.showUIKey = "com_msg_box_large"

  L4_2 = function()
    pcall(function() print("[X3MOD] Popup Accepted") end)
  end
  L2_2.acceptFunc = L4_2
  
  -- ✅ Fungsi tombol Join Telegram (Aman + Fallback)
  L5_2 = function()
    pcall(function()
      local Kismet = import("KismetSystemLibrary")
      if Kismet and Kismet.LaunchURL then
        Kismet.LaunchURL("https://t.me/X3TeamID")
      else
        slua.consoleCommand("LaunchURL https://t.me/X3TeamID")
      end
    end)
  end
  
  L2_2.refuseFunc = L5_2  -- ✅ FIXED: Mengarah ke function redirect, bukan string
  L1_2(L2_2)
end

L15_1 = _G
L15_1.TryShowLegalCredit = L14_1

function L15_1()
  local L0_2, L1_2, L2_2
  L0_2 = nil
  L1_2 = pcall
  
  function L2_2()
    local L0_3, L1_3
    L0_3 = L3_1.GetGameInstance
    if L0_3 then
      L0_3 = L3_1.GetGameInstance
      L0_3 = L0_3()
      L0_2 = L0_3
    end
    L0_3 = L0_2
    if not L0_3 then
      L0_3 = L4_1.GetGameInstance
      L0_3 = L0_3()
      L0_2 = L0_3
    end
  end
  
  L1_2(L2_2)
  return L0_2
end

function L16_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = L15_1
  L2_2 = L2_2()
  if L2_2 then
    L3_2 = pcall
    
    function L4_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3
      L0_3 = L2_2
      L1_3 = L0_3
      L0_3 = L0_3.ExecuteCMD
      L2_3 = A0_2
      L3_3 = tostring
      L4_3 = A1_2
      L3_3, L4_3 = L3_3(L4_3)
      L0_3(L1_3, L2_3, L3_3, L4_3)
    end
    
    L3_2(L4_2)
  end
end

function L17_1()
  local L0_2, L1_2, L2_2
  L0_2 = L16_1
  L1_2 = "r.CharacterDiffuseOffset"
  L2_2 = "2"
  L0_2(L1_2, L2_2)
  L0_2 = L16_1
  L1_2 = "r.CharacterDiffusePower"
  L2_2 = "5"
  L0_2(L1_2, L2_2)
  L0_2 = L16_1
  L1_2 = "r.CharacterMinShadowFactor"
  L2_2 = "100"
  L0_2(L1_2, L2_2)
  L0_2 = L16_1
  L1_2 = "r.CharacterDiffuseColorR"
  L2_2 = "255"
  L0_2(L1_2, L2_2)
  L0_2 = L16_1
  L1_2 = "r.CharacterDiffuseColorG"
  L2_2 = "255"
  L0_2(L1_2, L2_2)
  L0_2 = L16_1
  L1_2 = "r.CharacterDiffuseColorB"
  L2_2 = "0"
  L0_2(L1_2, L2_2)
  L0_2 = print
  L1_2 = "[ESP] White Body Applied!"
  L0_2(L1_2)
end

function L18_1()
  local L0_2, L1_2, L2_2
  L0_2 = L16_1
  L1_2 = "r.Fog"
  L2_2 = "0"
  L0_2(L1_2, L2_2)
  L0_2 = L16_1
  L1_2 = "r.Atmosphere"
  L2_2 = "0"
  L0_2(L1_2, L2_2)
  L0_2 = L16_1
  L1_2 = "r.LightShafts"
  L2_2 = "0"
  L0_2(L1_2, L2_2)
  L0_2 = L16_1
  L1_2 = "r.VolumetricFog"
  L2_2 = "0"
  L0_2(L1_2, L2_2)
  L0_2 = L16_1
  L1_2 = "r.FogDensity"
  L2_2 = "0"
  L0_2(L1_2, L2_2)
  L0_2 = L16_1
  L1_2 = "r.BloomQuality"
  L2_2 = "0"
  L0_2(L1_2, L2_2)
  L0_2 = print
  L1_2 = "[ESP] Fog Removed!"
  L0_2(L1_2)
end

function L19_1()
  local L0_2, L1_2, L2_2
  L0_2 = L16_1
  L1_2 = "grass.DensityScale"
  L2_2 = "0"
  L0_2(L1_2, L2_2)
  L0_2 = L16_1
  L1_2 = "grass.Enable"
  L2_2 = "0"
  L0_2(L1_2, L2_2)
  L0_2 = L16_1
  L1_2 = "r.FoliageQuality"
  L2_2 = "0"
  L0_2(L1_2, L2_2)
  L0_2 = L16_1
  L1_2 = "foliage.DensityScale"
  L2_2 = "0"
  L0_2(L1_2, L2_2)
  L0_2 = print
  L1_2 = "[ESP] Grass Removed!"
  L0_2(L1_2)
end

function L20_1()
  local L0_2, L1_2, L2_2
  L0_2 = L16_1
  L1_2 = "r.Water"
  L2_2 = "0"
  L0_2(L1_2, L2_2)
  L0_2 = L16_1
  L1_2 = "r.Ocean"
  L2_2 = "0"
  L0_2(L1_2, L2_2)
  L0_2 = L16_1
  L1_2 = "r.WaterReflection"
  L2_2 = "0"
  L0_2(L1_2, L2_2)
  L0_2 = print
  L1_2 = "[ESP] Water Removed!"
  L0_2(L1_2)
end

L21_1 = {}

function L22_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = Client
  if not L1_2 then
    return
  end
  L1_2 = A0_2._WallHighlightTimer
  if L1_2 then
    return
  end
  L1_2 = import
  L2_2 = "/Script/ShadowTrackerExtra.STExtraPlayerController"
  L1_2 = L1_2(L2_2)
  L2_2 = import
  L3_2 = "STExtraPlayerCharacter"
  L2_2 = L2_2(L3_2)
  L4_2 = A0_2
  L3_2 = A0_2.AddGameTimer
  L5_2 = 1
  L6_2 = true
  
  function L7_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3
    L0_3 = slua
    L0_3 = L0_3.isValid
    L1_3 = A0_2.Object
    L0_3 = L0_3(L1_3)
    if not L0_3 then
      return
    end
    L0_3 = slua_GameFrontendHUD
    L1_3 = L0_3
    L0_3 = L0_3.GetPlayerController
    L0_3 = L0_3(L1_3)
    L1_3 = Game
    L2_3 = L1_3
    L1_3 = L1_3.IsClassOf
    L3_3 = L0_3
    L4_3 = L1_2
    L1_3 = L1_3(L2_3, L3_3, L4_3)
    if not L1_3 then
      return
    end
    L1_3 = slua
    L1_3 = L1_3.isValid
    L2_3 = L0_3
    L1_3 = L1_3(L2_3)
    if not L1_3 then
      return
    end
    L2_3 = L0_3
    L1_3 = L0_3.GetCurPawnLocation
    L1_3 = L1_3(L2_3)
    L3_3 = L0_3
    L2_3 = L0_3.GetCurPawn
    L2_3 = L2_3(L3_3)
    L3_3 = -1
    L4_3 = Game
    L5_3 = L4_3
    L4_3 = L4_3.IsClassOf
    L6_3 = L2_3
    L7_3 = L2_2
    L4_3 = L4_3(L5_3, L6_3, L7_3)
    if L4_3 then
      L3_3 = L2_3.TeamID
    end
    L4_3 = L5_1.IsVector
    L5_3 = L1_3
    L4_3 = L4_3(L5_3)
    if not L4_3 then
      return
    end
    L4_3 = Game
    L5_3 = L4_3
    L4_3 = L4_3.GetAllPlayerPawns
    L4_3 = L4_3(L5_3)
    if not L4_3 then
      return
    end
    L5_3 = pairs
    L6_3 = L4_3
    L5_3, L6_3, L7_3 = L5_3(L6_3)
    for L8_3, L9_3 in L5_3, L6_3, L7_3 do
      L10_3 = slua
      L10_3 = L10_3.isValid
      L11_3 = L9_3
      L10_3 = L10_3(L11_3)
      if L10_3 then
        L10_3 = L9_3.Replay_CreateEnemyFrameUI
        if L10_3 then
          L10_3 = L9_3.Replay_SetVisiableOfFrameUI
          if L10_3 then
            L10_3 = L9_3.Replay_IsEnemyFrameUIExisted
            if L10_3 then
              L10_3 = false
              if not (L3_3 < 0) then
                L11_3 = L9_3.TeamID
                if L11_3 == L3_3 then
                  goto lbl_77
                end
              end
              L10_3 = true
              ::lbl_77::
              L11_3 = L9_3.HealthStatus
              if L11_3 then
                L11_3 = L5_1.IsHealthStatusAlive
                L12_3 = L9_3.HealthStatus
                L11_3 = L11_3(L12_3)
                if not L11_3 then
                  L10_3 = false
                end
              end
              if L10_3 and L1_3 then
                L12_3 = L9_3
                L11_3 = L9_3.K2_GetActorLocation
                L11_3 = L11_3(L12_3)
                L12_3 = L5_1.IsVector
                L13_3 = L11_3
                L12_3 = L12_3(L13_3)
                if L12_3 then
                  L12_3 = L11_3.Z
                  if 150000 <= L12_3 then
                    L10_3 = false
                  end
                  L12_3 = FVector
                  L12_3 = L12_3.Dist2D
                  L13_3 = L1_3
                  L14_3 = L11_3
                  L12_3 = L12_3(L13_3, L14_3)
                  if 50000 < L12_3 then
                    L10_3 = false
                  end
                end
              end
              if L10_3 then
                L12_3 = L9_3
                L11_3 = L9_3.Replay_IsEnemyFrameUIExisted
                L11_3 = L11_3(L12_3)
                if not L11_3 then
                  L12_3 = L9_3
                  L11_3 = L9_3.Replay_CreateEnemyFrameUI
                  L13_3 = true
                  L14_3 = true
                  L11_3(L12_3, L13_3, L14_3)
                end
                L12_3 = L9_3
                L11_3 = L9_3.Replay_SetVisiableOfFrameUI
                L13_3 = true
                L11_3(L12_3, L13_3)
              else
                L12_3 = L9_3
                L11_3 = L9_3.Replay_SetVisiableOfFrameUI
                L13_3 = false
                L11_3(L12_3, L13_3)
              end
            end
          end
        end
      end
    end
  end
  
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  A0_2._WallHighlightTimer = L3_2
end

L21_1.Initialize = L22_1

function L22_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = A0_2._WallHighlightTimer
  if L1_2 then
    L2_2 = A0_2
    L1_2 = A0_2.RemoveGameTimer
    L3_2 = A0_2._WallHighlightTimer
    L1_2(L2_2, L3_2)
    A0_2._WallHighlightTimer = nil
  end
end

L21_1.Cleanup = L22_1
L22_1 = {}

function L23_1(A0_2)
  local L1_2
  A0_2.ActiveForceMark = nil
  A0_2.LastMarkUpdate = 0
  A0_2._WallHighlightTimer = nil
  A0_2._whiteBodyApplied = false
  A0_2._fogRemoved = false
  A0_2._grassRemoved = false
  A0_2._waterRemoved = false
  A0_2.Feature_WhiteBody = true
  A0_2.Feature_RemoveFog = true
  A0_2.Feature_RemoveGrass = false
  A0_2.Feature_RemoveWater = false
end

L22_1.ctor = L23_1

function L23_1(A0_2)
  local L1_2, L2_2
  L1_2 = L1_1._PostConstruct
  L2_2 = A0_2
  L1_2(L2_2)
  L2_2 = A0_2
  L1_2 = A0_2.InitAddSpecialMoveInfo
  L1_2(L2_2)
  A0_2.bCanNearDeathGiveup = true
  L1_2 = print
  L2_2 = "BRPlayerCharacterBase:_PostConstruct"
  L1_2(L2_2)
end

L22_1.postConstruct = L23_1

function L23_1(A0_2)
  if __X3MOD_Check() then return end  -- 🛑 STOP EKSEKUSI JIKA SUDAH EXPIRED
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = L1_1.ReceiveBeginPlay
  L2_2 = A0_2
  L1_2(L2_2)
  L2_2 = A0_2
  L1_2 = A0_2.RegisterAvatarOutline
  L3_2 = false
  L1_2(L2_2, L3_2)
  L2_2 = A0_2
  L1_2 = A0_2.SetActorTickEnabled
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = EventSystem
  L2_2 = L1_2
  L1_2 = L1_2.postEvent
  L3_2 = EVENTTYPE_SINGLETRAINING
  L4_2 = EVENTID_CHARACTER_BEGINPLAY
  L5_2 = A0_2.Object
  L1_2(L2_2, L3_2, L4_2, L5_2)
  L1_2 = _G
  L1_2 = L1_2.TryShowLegalCredit
  L1_2()
  L2_2 = A0_2
  L1_2 = A0_2.AddGameTimer
  L3_2 = 1.0
  L4_2 = false
  
  function L5_2()
    local L0_3, L1_3
    L0_3 = A0_2
    L1_3 = L0_3
    L0_3 = L0_3.ApplyEnvironmentFeatures
    L0_3(L1_3)
  end
  
  L1_2(L2_2, L3_2, L4_2, L5_2)
  L1_2 = L21_1.Initialize
  L2_2 = A0_2
  L1_2(L2_2)
end

L22_1.receiveBeginPlay = L23_1

function L23_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = L21_1.Cleanup
  L3_2 = A0_2
  L2_2(L3_2)
  L2_2 = A0_2.ActiveForceMark
  if L2_2 then
    L2_2 = L8_1
    if L2_2 then
      L2_2 = L8_1.HideMapMark
      L3_2 = A0_2.ActiveForceMark
      L2_2(L3_2)
    end
    A0_2.ActiveForceMark = nil
  end
  L2_2 = L1_1.ReceiveEndPlay
  L3_2 = A0_2
  L4_2 = A1_2
  L2_2(L3_2, L4_2)
  L2_2 = Client
  if L2_2 then
    L2_2 = L3_1.RemoveCharacter
    if L2_2 then
      L2_2 = L3_1.RemoveCharacter
      L3_2 = A0_2.Object
      L2_2(L3_2)
    end
  end
end

L22_1.receiveEndPlay = L23_1

function L23_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = os
  L1_2 = L1_2.time
  L2_2 = os
  L2_2 = L2_2.date
  L3_2 = "!*t"
  L2_2, L3_2 = L2_2(L3_2)
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = L12_1
  if L1_2 > L2_2 then
    return
  end
  L1_2 = A0_2.Feature_WhiteBody
  if L1_2 then
    L1_2 = A0_2._whiteBodyApplied
    if not L1_2 then
      L1_2 = L17_1
      L1_2()
      A0_2._whiteBodyApplied = true
    end
  end
  L1_2 = A0_2.Feature_RemoveFog
  if L1_2 then
    L1_2 = A0_2._fogRemoved
    if not L1_2 then
      L1_2 = L18_1
      L1_2()
      A0_2._fogRemoved = true
    end
  end
  L1_2 = A0_2.Feature_RemoveGrass
  if L1_2 then
    L1_2 = A0_2._grassRemoved
    if not L1_2 then
      L1_2 = L19_1
      L1_2()
      A0_2._grassRemoved = true
    end
  end
  L1_2 = A0_2.Feature_RemoveWater
  if L1_2 then
    L1_2 = A0_2._waterRemoved
    if not L1_2 then
      L1_2 = L20_1
      L1_2()
      A0_2._waterRemoved = true
    end
  end
end

L22_1.ApplyEnvironmentFeatures = L23_1

function L23_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = os
  L1_2 = L1_2.time
  L2_2 = os
  L2_2 = L2_2.date
  L3_2 = "!*t"
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  L2_2 = L12_1
  if L1_2 > L2_2 then
    return
  end
  L1_2 = A0_2.Object
  L1_2 = L1_2.ThirdPersonCameraComponent
  L2_2 = slua
  L2_2 = L2_2.isValid
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L3_2 = L1_2
    L2_2 = L1_2.SetFieldOfView
    L4_2 = 104
    L2_2(L3_2, L4_2)
  end
end

L22_1.setFOV110 = L23_1

function L23_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = os
  L1_2 = L1_2.time
  L2_2 = os
  L2_2 = L2_2.date
  L3_2 = "!*t"
  L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2 = L2_2(L3_2)
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  L2_2 = L12_1
  if L1_2 > L2_2 then
    return
  end
  L1_2 = A0_2.Object
  L1_2 = L1_2.WeaponManagerComponent
  if not L1_2 then
    return
  end
  L2_2 = L1_2.CurrentWeaponReplicated
  if not L2_2 then
    return
  end
  L3_2 = L2_2.ShootWeaponEntityComp
  L4_2 = slua
  L4_2 = L4_2.isValid
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L3_2.RecoilKick = 0.02
  L3_2.RecoilKickADS = 0.1
  L3_2.AnimationKick = 0.03
  L3_2.AccessoriesVRecoilFactor = 0.3
  L3_2.AccessoriesHRecoilFactor = 0.5
  L3_2.GameDeviationFactor = 0.2
  L3_2.GameDeviationAccuracy = 0.4
  L3_2.DeviationMultiplier = 0.2
  L3_2.CameraShakeScale = 0.01
  L3_2.AimCameraShakeScale = 0.2
  L3_2.ShootCameraShakeScale = 0.06
  L3_2.FireCameraShakeScale = 0.01
  L3_2.ShotGunHorizontalSpread = 0.1
  L3_2.ShotGunVerticalSpread = 0.08
  L3_2.WeaponAimInTime = 7
  L3_2.SwitchFromIdleToBackpackTime = 0.2
  L3_2.SwitchFromBackpackToIdleTime = 0.2
  L3_2.ExtraHitPerformScale = 1
  L4_2 = L3_2.RecoilInfo
  if L4_2 then
    L4_2 = L3_2.RecoilInfo
    L4_2.VerticalRecoilMin = 0
    L4_2 = L3_2.RecoilInfo
    L4_2.VerticalRecoilMax = 0
    L4_2 = L3_2.RecoilInfo
    L4_2.RecoilSpeedVertical = 0
    L4_2 = L3_2.RecoilInfo
    L4_2.RecoilSpeedHorizontal = 0
    L4_2 = L3_2.RecoilInfo
    L4_2.VerticalRecoveryMax = 0.02
  end
  L3_2.RecoilModifierStand = 0.1
  L3_2.RecoilModifierCrouch = 0.09
  L3_2.RecoilModifierProne = 0.06
  L4_2 = L3_2.ShootCameraShake
  if L4_2 then
    L4_2 = L3_2.ShootCameraShake
    L4_2.Scale = 0.07
  end
  L4_2 = L3_2.AutoAimingConfig
  if L4_2 then
    L4_2 = ipairs
    L5_2 = {}
    L6_2 = "OuterRange"
    L7_2 = "InnerRange"
    L5_2[1] = L6_2
    L5_2[2] = L7_2
    L4_2, L5_2, L6_2 = L4_2(L5_2)
    for L7_2, L8_2 in L4_2, L5_2, L6_2 do
      L9_2 = L3_2.AutoAimingConfig
      L9_2 = L9_2[L8_2]
      if L9_2 then
        L9_2.Speed = 60
        L9_2.RangeRate = 70
        L9_2.SpeedRate = 90
        L9_2.RangeRateSight = 2.5
        L9_2.SpeedRateSight = 2
        L9_2.CrouchRate = 90
        L9_2.ProneRate = 90
        L9_2.DyingRate = 0
      end
    end
  end
end

L22_1.applyNoRecoil = L23_1

function L23_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = Client
  if not L2_2 then
    return
  end
  L2_2 = os
  L2_2 = L2_2.time
  L3_2 = os
  L3_2 = L3_2.date
  L4_2 = "!*t"
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2 = L3_2(L4_2)
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  L3_2 = L12_1
  if L2_2 > L3_2 then
    return
  end
  L3_2 = A0_2
  L2_2 = A0_2.getAvatarComponent2
  L2_2 = L2_2(L3_2)
  L3_2 = slua
  L3_2 = L3_2.isValid
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L3_2 = import
  L4_2 = "PostProcessManager"
  L3_2 = L3_2(L4_2)
  L4_2 = L3_2
  L3_2 = L3_2.GetInstance
  L3_2 = L3_2(L4_2)
  L4_2 = slua
  L4_2 = L4_2.isValid
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  if L4_2 then
    L4_2 = L3_2.IsPPEnabled
    if L4_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L4_2 = L3_1.GetPlayerCharacter
  L4_2 = L4_2()
  L5_2 = slua
  L5_2 = L5_2.isValid
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    return
  end
  L6_2 = L3_2
  L5_2 = L3_2.EnableAvatarOutline
  L7_2 = L2_2
  L8_2 = false
  L5_2(L6_2, L7_2, L8_2)
  L5_2 = L4_2.TeamID
  L6_2 = A0_2.TeamID
  if L5_2 ~= L6_2 then
    L3_2.OutlineThickness = 1
    L5_2 = FLinearColor
    L6_2 = 0
    L7_2 = 1
    L8_2 = 0
    L9_2 = 1
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
    L3_2.OutlineColor = L5_2
    L5_2 = pcall
    
    function L6_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
      L0_3 = L3_2.SetOutlineColor
      if L0_3 then
        L0_3 = L3_2
        L1_3 = L0_3
        L0_3 = L0_3.SetOutlineColor
        L2_3 = 0
        L3_3 = 1
        L4_3 = 0
        L5_3 = 1
        L0_3(L1_3, L2_3, L3_3, L4_3, L5_3)
      end
    end
    
    L5_2(L6_2)
    L6_2 = L3_2
    L5_2 = L3_2.EnableAvatarOutline
    L7_2 = L2_2
    L8_2 = true
    L5_2(L6_2, L7_2, L8_2)
  end
end

L22_1.registerAvatarOutline = L23_1

function L23_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = Client
  if not L1_2 then
    return
  end
  L1_2 = slua
  L1_2 = L1_2.isValid
  L2_2 = A0_2.Object
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    return
  end
  L1_2 = L3_1.GetPlayerCharacter
  L1_2 = L1_2()
  L2_2 = slua
  L2_2 = L2_2.isValid
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  L2_2 = L1_2.TeamID
  L3_2 = A0_2.TeamID
  if L2_2 ~= L3_2 then
    L2_2 = A0_2.Object
    L2_2 = L2_2.IsAlive
    if L2_2 then
      L2_2 = A0_2.Object
      L3_2 = L2_2
      L2_2 = L2_2.IsAlive
      L2_2 = L2_2(L3_2)
      if L2_2 then
        L2_2 = os
        L2_2 = L2_2.clock
        L2_2 = L2_2()
        L3_2 = A0_2.LastMarkUpdate
        L3_2 = L2_2 - L3_2
        if 0.7 < L3_2 then
          A0_2.LastMarkUpdate = L2_2
          L4_2 = A0_2
          L3_2 = A0_2.GetHeadLocation
          L5_2 = false
          L3_2 = L3_2(L4_2, L5_2)
          if not L3_2 then
            L4_2 = A0_2
            L3_2 = A0_2.GetFuzzyPosition
            L5_2 = FVector
            L6_2 = 0
            L7_2 = 0
            L8_2 = 0
            L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L5_2(L6_2, L7_2, L8_2)
            L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
          end
          if L3_2 then
            L4_2 = L8_1.ClientAddMapMark
            L5_2 = 1003
            L6_2 = L3_2
            L7_2 = 0
            L8_2 = ""
            L9_2 = 4
            L10_2 = nil
            L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
            L5_2 = A0_2.ActiveForceMark
            if L5_2 then
              L5_2 = L8_1
              if L5_2 then
                L5_2 = L8_1.HideMapMark
                L6_2 = A0_2.ActiveForceMark
                L5_2(L6_2)
              end
            end
            A0_2.ActiveForceMark = L4_2
          end
        end
      end
    end
  else
    L2_2 = A0_2.ActiveForceMark
    if L2_2 then
      L2_2 = L8_1
      if L2_2 then
        L2_2 = L8_1.HideMapMark
        L3_2 = A0_2.ActiveForceMark
        L2_2(L3_2)
      end
      A0_2.ActiveForceMark = nil
    end
  end
end

L22_1.updateMapMark = L23_1

function L23_1(A0_2)
  local L1_2
  L1_2 = A0_2.Object
  if L1_2 then
    L1_2 = A0_2.Object
    L1_2 = L1_2.Health
    if L1_2 then
      L1_2 = A0_2.Object
      L1_2 = L1_2.Health
      return L1_2
    end
  end
  L1_2 = 0
  return L1_2
end

L22_1.GetHPBarHealth = L23_1

function L23_1(A0_2)
  local L1_2
  L1_2 = A0_2.Object
  if L1_2 then
    L1_2 = A0_2.Object
    L1_2 = L1_2.HealthMax
    if L1_2 then
      L1_2 = A0_2.Object
      L1_2 = L1_2.HealthMax
      return L1_2
    end
  end
  L1_2 = 100
  return L1_2
end

L22_1.GetHPBarHealthMax = L23_1

function L23_1(A0_2)
  local L1_2, L2_2
  L1_2 = A0_2.Object
  if L1_2 then
    L1_2 = A0_2.Object
    L1_2 = L1_2.GetPlayerName
    if L1_2 then
      L1_2 = A0_2.Object
      L2_2 = L1_2
      L1_2 = L1_2.GetPlayerName
      return L1_2(L2_2)
    end
  end
  L1_2 = A0_2.PlayerName
  if L1_2 then
    L1_2 = A0_2.PlayerName
    return L1_2
  end
  L1_2 = "Player"
  return L1_2
end

L22_1.GetHPBarShowName = L23_1

function L23_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L3_2 = A0_2
  L2_2 = A0_2.SetFOV110
  L2_2(L3_2)
  L3_2 = A0_2
  L2_2 = A0_2.ApplyNoRecoil
  L2_2(L3_2)
  L3_2 = A0_2
  L2_2 = A0_2.UpdateMapMark
  L2_2(L3_2)
  L3_2 = A0_2
  L2_2 = A0_2.RegisterAvatarOutline
  L4_2 = false
  L2_2(L3_2, L4_2)
end

L22_1.receiveTick = L23_1
L23_1 = _G
L24_1 = L13_1.ServerRPC
L23_1.ServerRPC = L24_1
L23_1 = _G
L24_1 = L13_1.ClientRPC
L23_1.ClientRPC = L24_1
L23_1 = _G
L24_1 = L13_1.MulticastRPC
L23_1.MulticastRPC = L24_1
L23_1 = L0_1
L24_1 = L1_1
L25_1 = nil
L26_1 = {}
L27_1 = L13_1.ServerRPC
L26_1.ServerRPC = L27_1
L27_1 = L13_1.ClientRPC
L26_1.ClientRPC = L27_1
L27_1 = L13_1.MulticastRPC
L26_1.MulticastRPC = L27_1
L27_1 = L22_1.ctor
L26_1.ctor = L27_1
L27_1 = L22_1.postConstruct
L26_1._PostConstruct = L27_1
L27_1 = L22_1.receiveBeginPlay
L26_1.ReceiveBeginPlay = L27_1
L27_1 = L22_1.receiveEndPlay
L26_1.ReceiveEndPlay = L27_1
L27_1 = L22_1.receiveTick
L26_1.ReceiveTick = L27_1
L27_1 = L22_1.setFOV110
L26_1.SetFOV110 = L27_1
L27_1 = L22_1.applyNoRecoil
L26_1.ApplyNoRecoil = L27_1
L27_1 = L22_1.registerAvatarOutline
L26_1.RegisterAvatarOutline = L27_1
L27_1 = L22_1.updateMapMark
L26_1.UpdateMapMark = L27_1
L27_1 = L22_1.GetHPBarHealth
L26_1.GetHPBarHealth = L27_1
L27_1 = L22_1.GetHPBarHealthMax
L26_1.GetHPBarHealthMax = L27_1
L27_1 = L22_1.GetHPBarShowName
L26_1.GetHPBarShowName = L27_1
L23_1 = L23_1(L24_1, L25_1, L26_1)
L24_1 = L2_1.DeclareFeature
L25_1 = L23_1
L26_1 = {}
L27_1 = {}
L27_1.SkyTransition = "GameLua.Mod.BaseMod.Gameplay.Feature.SkyControl.PlayerCharacterSkyTransitionFeature"
L28_1 = {}
L28_1.CarryDeadBoxFeature = "GameLua.Mod.Library.GamePlay.Feature.CarryDeadBoxFeature"
L29_1 = {}
L29_1.SpecialSuitFeature = "GameLua.Mod.Library.GamePlay.Feature.SpecialSuitFeature"
L30_1 = {}
L30_1.TeleportPawnFeature = "GameLua.Mod.Library.GamePlay.Feature.TeleportPawnFeature"
L31_1 = {}
L31_1.LifterControl = "GameLua.Mod.BaseMod.Gameplay.Feature.Player.CharacterLifterControlFeature"
L32_1 = {}
L32_1.FinalKillEffect = "GameLua.Mod.BaseMod.Gameplay.Feature.Player.PlayerCharacterFinalKillEffectFeature"
L33_1 = {}
L33_1.CampFeature = "GameLua.Mod.BaseMod.GamePlay.Feature.Camp.PlayerCharacterCampFeature"
L34_1 = {}
L34_1.BuildSkateFeature = "GameLua.Mod.BaseMod.GamePlay.Feature.PlayerCharacterBuildVehicleFeature"
L35_1 = {}
L35_1.CommonBornlandTransformFeature = "GameLua.Mod.BaseMod.GamePlay.Feature.HeroPropFeature.CommonBornlandTransformFeature"
L26_1[1] = L27_1
L26_1[2] = L28_1
L26_1[3] = L29_1
L26_1[4] = L30_1
L26_1[5] = L31_1
L26_1[6] = L32_1
L26_1[7] = L33_1
L26_1[8] = L34_1
L26_1[9] = L35_1
L27_1 = "BRPlayerCharacterBase"
return L24_1(L25_1, L26_1, L27_1)
