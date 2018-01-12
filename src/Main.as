package {
	import com.lightUI.KGameComponents.assetsInPanel.AssetsInPanel;
	import com.lightUI.KGameComponents.assetsInPanel.AssetsVO;
	import com.lightUI.core.Light;
	import com.lightUI.net.SocketConnectEvent;
	
	import chinadolls.SlotConfigure;
	import chinadolls.SlotFacade;
	import chinadolls.mgr.SlotLayerManager;
	
	import laya.ani.bone.Skeleton;
	import laya.ani.bone.Templet;
	import laya.display.Sprite;
	import laya.display.Stage;
	import laya.events.Event;
	import laya.net.Loader;
	import laya.ui.Button;
	import laya.ui.Panel;
	import laya.utils.Browser;
	import laya.utils.Handler;
	import laya.utils.Stat;
	import laya.webgl.WebGL;
	
	public class Main{
		public function Main() {
			//初始化引擎
			Laya.init(1136, 640, WebGL);
			//不缩放   到时候采取的适配模式 应该是 左右居中  按照高度等比例缩放
			Laya.stage.scaleMode = Stage.SCALE_SHOWALL;
			//选择横屏模式
			Laya.stage.screenMode = Stage.SCREEN_HORIZONTAL;
			//设置水平对齐
			Laya.stage.alignH = "center";
			//设置垂直对齐
			Laya.stage.alignV = "middle";
			
			//Stat.show();
			
			Light.layer = SlotLayerManager.getInstance();
			Light.init(Laya.stage);

			var fa:SlotFacade = SlotFacade.getInstance();
			fa.configure(new SlotConfigure());
			fa.startPreLoad();
//			test();
		}
		
		private function test():void{
			
			Laya.loader.load([{url: "res/atlas/loading.json", type: Loader.ATLAS},{url: "res/atlas/comp.json", type: Loader.ATLAS},
				{ url:"res/atlas/room.json",type:"atlas"}
			
			], Handler.create(this, onLoaded));
//			SoundManager.playMusic("sound/BgSound_0.mp3",1);
//			MySoundManager.getInstance().playVoiceSound("TimesHalfSound",1);
//			MySoundManager.getInstance().playVoiceSound("FruitMoveReduce",1);
		}
		
		private var panel:AssetsInPanel ;
		
		
		private function onLoaded():void{
			
			start();
		}
		
		private function okHandler(vo:AssetsVO):void{
			
			trace("okHandler",vo,vo.amount_total,vo.amount_cash,vo.amount_coin)
			
			panel.close();
			
		}
		
		
		private function onSocketClose(e:SocketConnectEvent):void
		{
			trace("onSocketClose---------"+e.data);
			
		}
		
		private function onConnectionFailed(e:SocketConnectEvent):void
		{
			trace("连接失败"+e.data);
		}
		
		private function onSocketConnect():void
		{
			// TODO Auto Generated method stub
			trace("onSocketConnect ----------");
		}
		
		private function start():void
		{
//			var panel:Panel=new Panel();//添加panel，切忌要先将panel添加到舞台同时设置宽高，然后再去添加子对象
//			panel.width=500;
//			panel.height=500;
//			panel.vScrollBarSkin='comp/vscroll.png';//设置panel的垂直滚动条，方便看出panel的滚动变化
//			Laya.stage.addChild(panel);
//			
//			var sp:Sprite=new Sprite();//panel的子容器sp
////			sp.graphics.drawRect(0,0,500,1000,"#FF0000");
//			sp.size(500,1000);
//			panel.addChild(sp);
//			
//			
//			var btnAdd:Button=new Button();//点击按钮，动态添加sp的子对象，并改变子对象sp的宽高
//			btnAdd.skin='comp/button.png';
//			Laya.stage.addChild(btnAdd);
//			btnAdd.x=550;
//			btnAdd.label='ADD1000';
//			btnAdd.on(Event.CLICK,this,onClick,[sp,panel]);
			
			var templet:Templet = new Templet();
			templet.loadAni("res/ani/cowgirl.sk");
			templet.on(Event.COMPLETE, this, templetLoadComplete);
			
			
		}
		
		private function templetLoadComplete(templet:Templet):void
		{
			// TODO Auto Generated method stub
			var skeleton:Skeleton = templet.buildArmature(1); //支持换装
			skeleton.scale(0.5,0.5);
			skeleton.x = 500;
			skeleton.y = 600;
			skeleton.play(0,true);
			
			Laya.stage.addChild( skeleton);
		}
		
		private function onClick(sp:Sprite,panel:Panel):void
		{
			trace('Add1000');
			for(var i:int=0;i<1000;i++)
			{
				var button:Button=new Button('comp/button.png');
				button.label='button:'+i;
				sp.addChild(button);
				button.y=i*60;
			}
			sp.graphics.clear();
			sp.graphics.drawRect(0,0,500,1000*60,"#FF0000");
			sp.size(500,1000*60);//sp高度改变
			sp.event('resize');//此处是重点，sp动态改变宽高后，需要派发一个resize事件
		}
	}
}
