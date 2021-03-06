package flixel.util;

import flash.display.BitmapData;
import flixel.interfaces.IFlxDestroyable;
import flixel.interfaces.IFlxPooled;

class FlxDestroyUtil
{
	/**
	 * Checks if an object is not null before calling destroy(), always returns null.
	 * 
	 * @param	Object	An IFlxDestroyable object that will be destroyed if it's not null.
	 * @return	null
	 */
	public static function destroy<T:IFlxDestroyable>(Object:Null<IFlxDestroyable>):T
	{
		if (Object != null)
			Object.destroy(); 
		return null;
	}
	
	/**
	 * Completely destroys an array of destroyable objects:
	 * 1) Clears the array structure
	 * 2) Calls FlxDestroyUtil.destroy() on every element
	 *
	 * @param	Array<IFlxDestroyable>	An Array of IFlxDestroyable objects
	 */
	
	public static function destroyArray<T:IFlxDestroyable>(arr:Array<T>):Void
	{
		if (arr != null)
		{
			while (arr.length > 0)
			{
				var ifx:IFlxDestroyable = arr.pop();
				destroy(ifx);
			}
		}
	}
	
	/**
	 * Checks if an object is not null before putting it back into the pool, always returns null.
	 * 
	 * @param	Object	An IFlxPooled object that will be put back into the pool if it's not null
	 * @return	null
	 */
	public static function put<T:IFlxPooled>(Object:IFlxPooled):T
	{
		if (Object != null)
			Object.put();
		return null;
	}
	
	/**
	 * Checks if a BitmapData object is not null before calling dispose() on it, always returns null.
	 * 
	 * @param	Bitmap	A BitampData to be disposed if not null
	 * @return 	null
	 */
	public static function dispose(Bitmap:BitmapData):BitmapData
	{
		if (Bitmap != null)
			Bitmap.dispose();
		return null;
	}
}