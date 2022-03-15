package
{
   import mx.core.IFlexModuleFactory;
   import mx.core.UITextField;
   import mx.core.mx_internal;
   import mx.skins.halo.ApplicationBackground;
   import mx.skins.halo.BrokenImageBorderSkin;
   import mx.skins.halo.BusyCursor;
   import mx.skins.halo.ButtonBarButtonSkin;
   import mx.skins.halo.ButtonSkin;
   import mx.skins.halo.CheckBoxIcon;
   import mx.skins.halo.ComboBoxArrowSkin;
   import mx.skins.halo.DefaultDragImage;
   import mx.skins.halo.HaloBorder;
   import mx.skins.halo.HaloFocusRect;
   import mx.skins.halo.LinkButtonSkin;
   import mx.skins.halo.ListDropIndicator;
   import mx.skins.halo.PanelSkin;
   import mx.skins.halo.ScrollArrowSkin;
   import mx.skins.halo.ScrollThumbSkin;
   import mx.skins.halo.ScrollTrackSkin;
   import mx.skins.halo.TabSkin;
   import mx.skins.halo.TitleBackground;
   import mx.skins.halo.ToolTipBorder;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.IStyleManager2;
   
   public class _importer_Styles
   {
      
      private static var _embed_css_Assets_swf_1497710656_mx_skins_cursor_DragReject_609766565:Class = _class_embed_css_Assets_swf_1497710656_mx_skins_cursor_DragReject_609766565;
      
      private static var _embed_css_Assets_swf_1497710656_mx_skins_cursor_DragLink_877747974:Class = _class_embed_css_Assets_swf_1497710656_mx_skins_cursor_DragLink_877747974;
      
      private static var _embed_css_Assets_swf_1497710656_mx_skins_cursor_DragMove_877773549:Class = _class_embed_css_Assets_swf_1497710656_mx_skins_cursor_DragMove_877773549;
      
      private static var _embed_css_Assets_swf_1497710656_mx_skins_cursor_DragCopy_877485969:Class = _class_embed_css_Assets_swf_1497710656_mx_skins_cursor_DragCopy_877485969;
      
      private static var _embed_css_Assets_swf_1497710656_mx_skins_cursor_BusyCursor_559306535:Class = _class_embed_css_Assets_swf_1497710656_mx_skins_cursor_BusyCursor_559306535;
      
      private static var _embed_css_Assets_swf_1497710656___brokenImage_586755055:Class = _class_embed_css_Assets_swf_1497710656___brokenImage_586755055;
       
      
      public function _importer_Styles()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var style:CSSStyleDeclaration = null;
         var effects:Array = null;
         var fbs:IFlexModuleFactory = param1;
         var styleManager:IStyleManager2 = fbs.getImplementation("mx.styles::IStyleManager2") as IStyleManager2;
         style = styleManager.getStyleDeclaration(".activeButtonStyle");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration(".activeButtonStyle",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
            };
         }
         styleManager.setStyleDeclaration(".activeButtonStyle",style,false);
         style = styleManager.getStyleDeclaration(".activeTabStyle");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration(".activeTabStyle",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.fontWeight = "bold";
            };
         }
         styleManager.setStyleDeclaration(".activeTabStyle",style,false);
         style = styleManager.getStyleDeclaration("Alert");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration("Alert",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.paddingTop = 2;
               this.borderColor = 8821927;
               this.roundedBottomCorners = true;
               this.color = 16777215;
               this.buttonStyleName = "alertButtonStyle";
               this.backgroundColor = 8821927;
               this.borderAlpha = 0.9;
               this.paddingLeft = 10;
               this.paddingBottom = 2;
               this.backgroundAlpha = 0.9;
               this.paddingRight = 10;
            };
         }
         styleManager.setStyleDeclaration("Alert",style,false);
         style = styleManager.getStyleDeclaration(".alertButtonStyle");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration(".alertButtonStyle",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.color = 734012;
            };
         }
         styleManager.setStyleDeclaration(".alertButtonStyle",style,false);
         style = styleManager.getStyleDeclaration("Application");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration("Application",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.backgroundSize = "100%";
               this.paddingTop = 24;
               this.backgroundColor = 8821927;
               this.backgroundImage = ApplicationBackground;
               this.horizontalAlign = "center";
               this.backgroundGradientAlphas = [1,1];
               this.paddingLeft = 24;
               this.paddingBottom = 24;
               this.paddingRight = 24;
            };
         }
         styleManager.setStyleDeclaration("Application",style,false);
         style = styleManager.getStyleDeclaration("Button");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration("Button",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.fontWeight = "bold";
               this.paddingTop = 2;
               this.cornerRadius = 4;
               this.labelVerticalOffset = 0;
               this.textAlign = "center";
               this.emphasizedSkin = null;
               this.verticalGap = 2;
               this.horizontalGap = 2;
               this.skin = ButtonSkin;
               this.paddingLeft = 10;
               this.paddingBottom = 2;
               this.paddingRight = 10;
            };
         }
         styleManager.setStyleDeclaration("Button",style,false);
         style = styleManager.getStyleDeclaration("ButtonBar");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration("ButtonBar",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.lastButtonStyleName = "";
               this.firstButtonStyleName = "";
               this.textAlign = "center";
               this.horizontalAlign = "center";
               this.verticalAlign = "middle";
               this.verticalGap = 0;
               this.horizontalGap = 0;
            };
         }
         styleManager.setStyleDeclaration("ButtonBar",style,false);
         style = styleManager.getStyleDeclaration("ButtonBarButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration("ButtonBarButton",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.upSkin = null;
               this.selectedDownSkin = null;
               this.overSkin = null;
               this.downSkin = null;
               this.selectedDisabledSkin = null;
               this.selectedUpSkin = null;
               this.disabledSkin = null;
               this.horizontalGap = 1;
               this.skin = ButtonBarButtonSkin;
               this.selectedOverSkin = null;
            };
         }
         styleManager.setStyleDeclaration("ButtonBarButton",style,false);
         style = styleManager.getStyleDeclaration("CheckBox");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration("CheckBox",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.downSkin = null;
               this.iconColor = 2831164;
               this.selectedDownIcon = null;
               this.selectedUpSkin = null;
               this.overIcon = null;
               this.skin = null;
               this.upSkin = null;
               this.selectedDownSkin = null;
               this.selectedOverIcon = null;
               this.selectedDisabledIcon = null;
               this.textAlign = "left";
               this.horizontalGap = 5;
               this.paddingBottom = 2;
               this.downIcon = null;
               this.icon = CheckBoxIcon;
               this.overSkin = null;
               this.paddingTop = 2;
               this.disabledIcon = null;
               this.selectedDisabledSkin = null;
               this.upIcon = null;
               this.paddingLeft = 0;
               this.paddingRight = 0;
               this.fontWeight = "normal";
               this.selectedUpIcon = null;
               this.labelVerticalOffset = 0;
               this.disabledSkin = null;
               this.selectedOverSkin = null;
            };
         }
         styleManager.setStyleDeclaration("CheckBox",style,false);
         style = styleManager.getStyleDeclaration("ComboBox");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration("ComboBox",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.fontWeight = "bold";
               this.disabledIconColor = 9542041;
               this.paddingTop = 0;
               this.dropdownStyleName = "comboDropdown";
               this.leading = 0;
               this.arrowButtonWidth = 22;
               this.cornerRadius = 5;
               this.editableSkin = null;
               this.paddingBottom = 0;
               this.skin = ComboBoxArrowSkin;
               this.paddingLeft = 5;
               this.paddingRight = 5;
            };
         }
         styleManager.setStyleDeclaration("ComboBox",style,false);
         style = styleManager.getStyleDeclaration(".comboDropdown");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration(".comboDropdown",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.shadowDirection = "center";
               this.fontWeight = "normal";
               this.dropShadowEnabled = true;
               this.leading = 0;
               this.backgroundColor = 16777215;
               this.shadowDistance = 1;
               this.cornerRadius = 0;
               this.borderThickness = 0;
               this.paddingLeft = 5;
               this.paddingRight = 5;
            };
         }
         styleManager.setStyleDeclaration(".comboDropdown",style,false);
         style = styleManager.getStyleDeclaration("Container");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration("Container",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.borderStyle = "none";
               this.borderSkin = HaloBorder;
            };
         }
         styleManager.setStyleDeclaration("Container",style,false);
         style = styleManager.getStyleDeclaration("ControlBar");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration("ControlBar",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.disabledOverlayAlpha = 0;
               this.borderStyle = "controlBar";
               this.paddingTop = 10;
               this.verticalAlign = "middle";
               this.paddingLeft = 10;
               this.paddingBottom = 10;
               this.paddingRight = 10;
            };
         }
         styleManager.setStyleDeclaration("ControlBar",style,false);
         style = styleManager.getStyleDeclaration(".dataGridStyles");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration(".dataGridStyles",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.fontWeight = "bold";
            };
         }
         styleManager.setStyleDeclaration(".dataGridStyles",style,false);
         style = styleManager.getStyleDeclaration(".dateFieldPopup");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration(".dateFieldPopup",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.dropShadowEnabled = true;
               this.backgroundColor = 16777215;
               this.borderThickness = 0;
            };
         }
         styleManager.setStyleDeclaration(".dateFieldPopup",style,false);
         style = styleManager.getStyleDeclaration(".headerDateText");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration(".headerDateText",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.fontWeight = "bold";
               this.textAlign = "center";
            };
         }
         styleManager.setStyleDeclaration(".headerDateText",style,false);
         style = styleManager.getStyleDeclaration(".headerDragProxyStyle");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration(".headerDragProxyStyle",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.fontWeight = "bold";
            };
         }
         styleManager.setStyleDeclaration(".headerDragProxyStyle",style,false);
         style = styleManager.getStyleDeclaration("LinkButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration("LinkButton",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.upSkin = null;
               this.selectedDownSkin = null;
               this.overSkin = null;
               this.downSkin = null;
               this.selectedDisabledSkin = null;
               this.selectedUpSkin = null;
               this.disabledSkin = null;
               this.skin = LinkButtonSkin;
               this.paddingLeft = 7;
               this.selectedOverSkin = null;
               this.paddingRight = 7;
            };
         }
         styleManager.setStyleDeclaration("LinkButton",style,false);
         style = styleManager.getStyleDeclaration(".linkButtonStyle");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration(".linkButtonStyle",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.paddingTop = 2;
               this.paddingLeft = 2;
               this.paddingBottom = 2;
               this.paddingRight = 2;
            };
         }
         styleManager.setStyleDeclaration(".linkButtonStyle",style,false);
         style = styleManager.getStyleDeclaration("ListBase");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration("ListBase",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.borderStyle = "solid";
               this.paddingTop = 2;
               this.backgroundColor = 16777215;
               this.backgroundDisabledColor = 14540253;
               this.dropIndicatorSkin = ListDropIndicator;
               this.paddingLeft = 2;
               this.paddingBottom = 2;
               this.paddingRight = 0;
            };
         }
         styleManager.setStyleDeclaration("ListBase",style,false);
         style = styleManager.getStyleDeclaration(".opaquePanel");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration(".opaquePanel",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.borderColor = 16777215;
               this.backgroundColor = 16777215;
               this.headerColors = [15198183,14277081];
               this.footerColors = [15198183,13092807];
               this.borderAlpha = 1;
            };
         }
         styleManager.setStyleDeclaration(".opaquePanel",style,false);
         style = styleManager.getStyleDeclaration("Panel");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration("Panel",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.statusStyleName = "windowStatus";
               this.borderStyle = "default";
               this.paddingTop = 0;
               this.borderColor = 14869218;
               this.backgroundColor = 16777215;
               this.cornerRadius = 4;
               this.titleBackgroundSkin = TitleBackground;
               this.borderAlpha = 0.4;
               this.borderThicknessTop = 2;
               this.paddingLeft = 0;
               this.resizeEndEffect = "Dissolve";
               this.paddingRight = 0;
               this.titleStyleName = "windowStyles";
               this.roundedBottomCorners = false;
               this.borderThicknessRight = 10;
               this.dropShadowEnabled = true;
               this.resizeStartEffect = "Dissolve";
               this.borderSkin = PanelSkin;
               this.borderThickness = 0;
               this.borderThicknessLeft = 10;
               this.paddingBottom = 0;
            };
         }
         effects = style.mx_internal::effects;
         if(!effects)
         {
            effects = style.mx_internal::effects = [];
         }
         effects.push("resizeEndEffect");
         effects.push("resizeStartEffect");
         effects.push("resizeEndEffect");
         effects.push("resizeStartEffect");
         styleManager.setStyleDeclaration("Panel",style,false);
         style = styleManager.getStyleDeclaration(".plain");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration(".plain",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.paddingTop = 0;
               this.backgroundColor = 16777215;
               this.backgroundImage = "";
               this.horizontalAlign = "left";
               this.paddingLeft = 0;
               this.paddingBottom = 0;
               this.paddingRight = 0;
            };
         }
         styleManager.setStyleDeclaration(".plain",style,false);
         style = styleManager.getStyleDeclaration(".popUpMenu");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration(".popUpMenu",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.fontWeight = "normal";
               this.textAlign = "left";
            };
         }
         styleManager.setStyleDeclaration(".popUpMenu",style,false);
         style = styleManager.getStyleDeclaration(".richTextEditorTextAreaStyle");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration(".richTextEditorTextAreaStyle",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
            };
         }
         styleManager.setStyleDeclaration(".richTextEditorTextAreaStyle",style,false);
         style = styleManager.getStyleDeclaration("ScrollBar");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration("ScrollBar",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.thumbOffset = 0;
               this.paddingTop = 0;
               this.borderColor = 12040892;
               this.trackColors = [9738651,15198183];
               this.trackSkin = ScrollTrackSkin;
               this.downArrowSkin = ScrollArrowSkin;
               this.cornerRadius = 4;
               this.upArrowSkin = ScrollArrowSkin;
               this.paddingLeft = 0;
               this.paddingBottom = 0;
               this.thumbSkin = ScrollThumbSkin;
               this.paddingRight = 0;
            };
         }
         styleManager.setStyleDeclaration("ScrollBar",style,false);
         style = styleManager.getStyleDeclaration(".swatchPanelTextField");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration(".swatchPanelTextField",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.borderStyle = "inset";
               this.borderColor = 14015965;
               this.highlightColor = 12897484;
               this.backgroundColor = 16777215;
               this.shadowCapColor = 14015965;
               this.shadowColor = 14015965;
               this.paddingLeft = 5;
               this.buttonColor = 7305079;
               this.borderCapColor = 9542041;
               this.paddingRight = 5;
            };
         }
         styleManager.setStyleDeclaration(".swatchPanelTextField",style,false);
         style = styleManager.getStyleDeclaration("Tab");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration("Tab",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.upSkin = null;
               this.selectedDownSkin = null;
               this.overSkin = null;
               this.downSkin = null;
               this.selectedDisabledSkin = null;
               this.paddingTop = 1;
               this.selectedUpSkin = null;
               this.disabledSkin = null;
               this.skin = TabSkin;
               this.paddingBottom = 1;
               this.selectedOverSkin = null;
            };
         }
         styleManager.setStyleDeclaration("Tab",style,false);
         style = styleManager.getStyleDeclaration("TabBar");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration("TabBar",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.selectedTabTextStyleName = "activeTabStyle";
               this.textAlign = "center";
               this.horizontalAlign = "left";
               this.verticalAlign = "top";
               this.verticalGap = -1;
               this.horizontalGap = -1;
            };
         }
         styleManager.setStyleDeclaration("TabBar",style,false);
         style = styleManager.getStyleDeclaration(".textAreaVScrollBarStyle");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration(".textAreaVScrollBarStyle",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
            };
         }
         styleManager.setStyleDeclaration(".textAreaVScrollBarStyle",style,false);
         style = styleManager.getStyleDeclaration(".textAreaHScrollBarStyle");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration(".textAreaHScrollBarStyle",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
            };
         }
         styleManager.setStyleDeclaration(".textAreaHScrollBarStyle",style,false);
         style = styleManager.getStyleDeclaration("TextInput");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration("TextInput",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.paddingTop = 0;
               this.backgroundColor = 16777215;
               this.borderSkin = HaloBorder;
               this.backgroundDisabledColor = 14540253;
               this.paddingLeft = 0;
               this.paddingRight = 0;
            };
         }
         styleManager.setStyleDeclaration("TextInput",style,false);
         style = styleManager.getStyleDeclaration("TileList");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration("TileList",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.textAlign = "center";
               this.verticalAlign = "middle";
               this.paddingLeft = 2;
               this.paddingRight = 2;
            };
         }
         styleManager.setStyleDeclaration("TileList",style,false);
         style = styleManager.getStyleDeclaration(".todayStyle");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration(".todayStyle",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.color = 16777215;
               this.textAlign = "center";
            };
         }
         styleManager.setStyleDeclaration(".todayStyle",style,false);
         style = styleManager.getStyleDeclaration(".windowStatus");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration(".windowStatus",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.color = 6710886;
            };
         }
         styleManager.setStyleDeclaration(".windowStatus",style,false);
         style = styleManager.getStyleDeclaration(".windowStyles");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration(".windowStyles",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.fontWeight = "bold";
            };
         }
         styleManager.setStyleDeclaration(".windowStyles",style,false);
         style = styleManager.getStyleDeclaration(".weekDayStyle");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration(".weekDayStyle",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.fontWeight = "bold";
               this.textAlign = "center";
            };
         }
         styleManager.setStyleDeclaration(".weekDayStyle",style,false);
         style = styleManager.getStyleDeclaration("global");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration("global",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.lineHeight = "120%";
               this.kerning = false;
               this.iconColor = 1118481;
               this.horizontalAlign = "left";
               this.filled = true;
               this.textDecoration = "none";
               this.columnCount = "auto";
               this.dominantBaseline = "roman";
               this.fontThickness = 0;
               this.focusBlendMode = "normal";
               this.blockProgression = "tb";
               this.buttonColor = 7305079;
               this.indentation = 17;
               this.textAlignLast = "start";
               this.paddingTop = 0;
               this.textAlpha = 1;
               this.rollOverColor = 11723263;
               this.fontSize = 10;
               this.bevel = true;
               this.shadowColor = 15658734;
               this.columnGap = 0;
               this.paddingLeft = 0;
               this.indicatorGap = 14;
               this.fontWeight = "normal";
               this.focusSkin = HaloFocusRect;
               this.dropShadowEnabled = false;
               this.breakOpportunity = "auto";
               this.leading = 2;
               this.renderingMode = "cff";
               this.borderThickness = 1;
               this.backgroundSize = "auto";
               this.borderColor = 12040892;
               this.shadowDistance = 2;
               this.stroked = false;
               this.digitWidth = "default";
               this.ligatureLevel = "common";
               this.verticalAlign = "top";
               this.fillAlphas = [0.6,0.4,0.75,0.65];
               this.firstBaselineOffset = "ascent";
               this.version = "4.0.0";
               this.shadowDirection = "center";
               this.lineBreak = "toFit";
               this.fontLookup = "auto";
               this.openDuration = 250;
               this.repeatInterval = 35;
               this.fontFamily = "Verdana";
               this.paddingBottom = 0;
               this.strokeWidth = 1;
               this.lineThrough = false;
               this.textFieldClass = UITextField;
               this.alignmentBaseline = "useDominantBaseline";
               this.trackingLeft = 0;
               this.fontStyle = "normal";
               this.verticalGridLines = true;
               this.dropShadowColor = 0;
               this.selectionColor = 8376063;
               this.focusRoundedCorners = "tl tr bl br";
               this.paddingRight = 0;
               this.borderSides = "left top right bottom";
               this.disabledIconColor = 10066329;
               this.textJustify = "interWord";
               this.focusColor = 40447;
               this.selectionDuration = 250;
               this.typographicCase = "default";
               this.highlightAlphas = [0.3,0];
               this.unfocusedSelectionColor = 15263976;
               this.fillColor = 16777215;
               this.textRollOverColor = 2831164;
               this.digitCase = "default";
               this.shadowCapColor = 14015965;
               this.backgroundAlpha = 1;
               this.justificationRule = "space";
               this.roundedBottomCorners = true;
               this.trackingRight = 0;
               this.fillColors = [16777215,13421772,16777215,15658734];
               this.horizontalGap = 8;
               this.borderCapColor = 9542041;
               this.leadingModel = "auto";
               this.closeDuration = 250;
               this.selectionDisabledColor = 14540253;
               this.embedFonts = false;
               this.letterSpacing = 0;
               this.focusAlpha = 0.4;
               this.borderAlpha = 1;
               this.baselineShift = 0;
               this.fontSharpness = 0;
               this.borderSkin = HaloBorder;
               this.modalTransparencyDuration = 100;
               this.justificationStyle = "pushInKinsoku";
               this.borderStyle = "inset";
               this.textRotation = "auto";
               this.fontAntiAliasType = "advanced";
               this.errorColor = 16711680;
               this.cffHinting = "horizontalStem";
               this.direction = "ltr";
               this.locale = "en";
               this.horizontalGridLineColor = 16250871;
               this.cornerRadius = 0;
               this.modalTransparencyColor = 14540253;
               this.textIndent = 0;
               this.themeColor = 40447;
               this.verticalGridLineColor = 14015965;
               this.modalTransparency = 0.5;
               this.columnWidth = "auto";
               this.textAlign = "left";
               this.textSelectedColor = 2831164;
               this.whiteSpaceCollapse = "collapse";
               this.fontGridFitType = "pixel";
               this.horizontalGridLines = false;
               this.useRollOver = true;
               this.repeatDelay = 500;
               this.focusThickness = 2;
               this.disabledColor = 11187123;
               this.verticalGap = 6;
               this.inactiveSelectionColor = 15263976;
               this.modalTransparencyBlur = 3;
               this.color = 734012;
            };
         }
         styleManager.setStyleDeclaration("global",style,false);
         style = styleManager.getStyleDeclaration("CursorManager");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration("CursorManager",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.busyCursor = BusyCursor;
               this.busyCursorBackground = _embed_css_Assets_swf_1497710656_mx_skins_cursor_BusyCursor_559306535;
            };
         }
         styleManager.setStyleDeclaration("CursorManager",style,false);
         style = styleManager.getStyleDeclaration("DragManager");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration("DragManager",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.copyCursor = _embed_css_Assets_swf_1497710656_mx_skins_cursor_DragCopy_877485969;
               this.moveCursor = _embed_css_Assets_swf_1497710656_mx_skins_cursor_DragMove_877773549;
               this.rejectCursor = _embed_css_Assets_swf_1497710656_mx_skins_cursor_DragReject_609766565;
               this.linkCursor = _embed_css_Assets_swf_1497710656_mx_skins_cursor_DragLink_877747974;
               this.defaultDragImageSkin = DefaultDragImage;
            };
         }
         styleManager.setStyleDeclaration("DragManager",style,false);
         style = styleManager.getStyleDeclaration(".errorTip");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration(".errorTip",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.fontWeight = "bold";
               this.borderStyle = "errorTipRight";
               this.paddingTop = 4;
               this.borderColor = 13510953;
               this.color = 16777215;
               this.fontSize = 9;
               this.shadowColor = 0;
               this.paddingLeft = 4;
               this.paddingBottom = 4;
               this.paddingRight = 4;
            };
         }
         styleManager.setStyleDeclaration(".errorTip",style,false);
         style = styleManager.getStyleDeclaration("SWFLoader");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration("SWFLoader",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.borderStyle = "none";
               this.brokenImageSkin = _embed_css_Assets_swf_1497710656___brokenImage_586755055;
               this.brokenImageBorderSkin = BrokenImageBorderSkin;
            };
         }
         styleManager.setStyleDeclaration("SWFLoader",style,false);
         style = styleManager.getStyleDeclaration("ToolTip");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration("ToolTip",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.borderStyle = "toolTip";
               this.paddingTop = 2;
               this.borderColor = 9542041;
               this.backgroundColor = 16777164;
               this.borderSkin = ToolTipBorder;
               this.cornerRadius = 2;
               this.fontSize = 9;
               this.shadowColor = 0;
               this.paddingLeft = 4;
               this.paddingBottom = 2;
               this.backgroundAlpha = 0.95;
               this.paddingRight = 4;
            };
         }
         styleManager.setStyleDeclaration("ToolTip",style,false);
         style = styleManager.getStyleDeclaration(".buttonBarFirstButtonStyle");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration(".buttonBarFirstButtonStyle",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.skin = null;
            };
         }
         styleManager.setStyleDeclaration(".buttonBarFirstButtonStyle",style,false);
         style = styleManager.getStyleDeclaration(".buttonBarLastButtonStyle");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration(".buttonBarLastButtonStyle",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.skin = null;
            };
         }
         styleManager.setStyleDeclaration(".buttonBarLastButtonStyle",style,false);
         style = styleManager.getStyleDeclaration("ComboBase");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration("ComboBase",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.borderSkin = HaloBorder;
            };
         }
         styleManager.setStyleDeclaration("ComboBase",style,false);
         style = styleManager.getStyleDeclaration("NavBar");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration("NavBar",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.borderSkin = HaloBorder;
            };
         }
         styleManager.setStyleDeclaration("NavBar",style,false);
         style = styleManager.getStyleDeclaration("ScrollControlBase");
         if(!style)
         {
            style = new CSSStyleDeclaration(null,styleManager);
            styleManager.setStyleDeclaration("ScrollControlBase",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.borderSkin = HaloBorder;
               this.focusRoundedCorners = "tl tr bl br";
            };
         }
         styleManager.setStyleDeclaration("ScrollControlBase",style,false);
      }
   }
}
