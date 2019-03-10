// Bakery Class

struct Cookie:
{
	var size = 5
	var hasCocolate = true
}

protocol: bakeryDelegate
{
	func cookieMade(_ cookie: Cookie)
}

// Bakery class - Boss
class Bakery:
{
	var storeWorker = bakeryDelegate?
	
	func makeCookie(_ size: Int, _ hasCocolate: Bool)
	{
		var newCookie = Cookie()
		newCookie.size = size
		newCookie.hasCocolate = hasCocolate
		
		storeWorker?.cookieMade(newCookie)
	}
}

// cookieStore class - Worker
class CookieStore: bakeryDelegate
{
	func cookieMade(_ cookie: Cookie)
	{
		print("Cookie of size \(cookie.size) was made!")
	}
}

// Main
var bakery = Bakery()
var cookieStore = CookieStore()

bakery.storeWorker = cookieStore
bakery.makeCookie(10, true)
