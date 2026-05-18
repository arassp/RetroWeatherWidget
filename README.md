# RetroWeather 🌤️

If you used Windows Vista or 7, you probably remember the sidebar widgets. A little weather card sitting in the corner of your desktop, showing the temperature and a sun or cloud icon. Simple, clean, always there. Then Windows 8 came out and Microsoft just... removed them. I missed them. So I built this.

RetroWeather is a [Rainmeter](https://www.rainmeter.net/) skin that brings back the old weather widget. It looks and feels like those old Vista/7 gadgets, but underneath it's pulling live weather, air quality, UV index, and wind data from a modern API.. for free, no account or API key needed. You can switch between Celsius and Fahrenheit, change your location by typing any city. Oh, and it automatically shifts into a dark mode moon after sunset.

Retroweather works on Windows 7 and above. 

![RetroWeather Preview](preview.png)

---

## Features

- **Live weather** — current temperature, conditions, high/low
- **3-day forecast** — with weather icons, temperatures, and UV index
- **Wind speed** — auto-converts between mph and km/h based on unit selection
- **Air Quality Index (AQI)** — with color-coded indicator bar
- **Day/Night mode** — automatically switches based on local sunrise/sunset
- **Celsius/Fahrenheit toggle** — via right-click context menu
- **Location switcher** — type any city name or US zip code to change location
- **Meteocons weather icons** — color-coded by condition (sun = yellow, cloud = white, rain = blue, etc.)
- **Auto-updates** — refreshes every 5 minutes
- **No API key required** — uses the free Open-Meteo API

---

## Requirements

- [Rainmeter 4.5+](https://www.rainmeter.net/)
- Windows 7 SP1 and above 
- Windows 7 users only: [Windows Management Framework 5.1](https://www.microsoft.com/en-us/download/details.aspx?id=54616) required for the location switcher
- [Meteocons font](https://www.alessioatzeni.com/meteocons/) (included in `@Resources/Fonts`)

---

## Installation

1. Download or clone this repository
2. Copy the `RetroWeather` folder to your Rainmeter Skins directory:
   
   ```
   Documents\Rainmeter\Skins\RetroWeather\
   ```
4. Open Rainmeter Manager, find **RetroWeather** and click **Load**
5. The Meteocons font will be loaded automatically from `@Resources\Fonts\`

---

## Configuration

Open `Retroweather.ini` and edit the `[Variables]` section:

```ini
[Variables]
Latitude=YOUR_LATITUDE
Longitude=YOUR_LONGITUDE
Location=Your City, State
TempUnit=fahrenheit        ; or celsius
UnitLetter=+               ; + for °F, * for °C
UseMPH=1                   ; 1 for mph, 0 for km/h
WindUnit=mph               ; or km/h
```

To find your latitude and longitude, go to [Google Maps](https://maps.google.com), right-click your location and copy the coordinates.

---

## Location Switcher

Right-click the widget and select **Change Location...** to type any city name or US zip code. The skin will automatically geocode the location using the [Open-Meteo Geocoding API](https://open-meteo.com/en/docs/geocoding-api) and update.

> **Windows 7 users:** The location switcher requires PowerShell 5.1. Install [WMF 5.1](https://www.microsoft.com/en-us/download/details.aspx?id=54616) if it doesn't work. You may also need to enable TLS 1.2 — see the [Windows 7 Notes](#windows-7-notes) section below.

---

## Right-Click Menu
Right-click the widget and select "custom skin actions" for the following options: 
| Option | Description |
|---|---|
| Refresh weather | Forces an immediate weather update |
| Use Celsius | Switches to °C and km/h |
| Use Fahrenheit | Switches to °F and mph |
| Change Location... | Opens location input dialog |

---

## APIs Used

| API | Purpose | Cost |
|---|---|---|
| [Open-Meteo Forecast](https://open-meteo.com/en/docs) | Weather & UV index | Free |
| [Open-Meteo Air Quality](https://open-meteo.com/en/docs/air-quality-api) | AQI | Free |
| [Open-Meteo Geocoding](https://open-meteo.com/en/docs/geocoding-api) | Location search | Free |

No API key needed. No account. No limits that matter for personal use.

---

## AQI Color Scale

| Color | AQI Range | Category |
|---|---|---|
| 🟢 Green | 0–50 | Good |
| 🟡 Yellow | 51–100 | Moderate |
| 🟠 Orange | 101–150 | Unhealthy for Sensitive Groups |
| 🔴 Red | 151–200 | Unhealthy |
| 🟣 Purple | 201–250 | Very Unhealthy |
| 🟤 Maroon | 251+ | Hazardous |

---

## Windows 7 Notes

Windows 7 ships with PowerShell 2.0 which lacks TLS 1.2 support, required by the Open-Meteo API. To fix this:

1. Install [WMF 5.1](https://www.microsoft.com/en-us/download/details.aspx?id=54616) — download `Win7AndW2K8R2-KB3191566-x64.zip`, extract it, and run the `.msu` file
2. Restart your computer
3. The location switcher should now work

---

## Credits

- Weather data by [Open-Meteo](https://open-meteo.com/) (CC BY 4.0)
- Icons by [Meteocons](https://www.alessioatzeni.com/meteocons/)
- Built with [Rainmeter](https://www.rainmeter.net/)

---
## FAQ

**Does this work on Windows 10 and 11?**
Yes. It was originally built on Windows 7 but works on all modern versions of Windows. Windows 10 and 11 users will have an easier setup since PowerShell 5.1 and TLS 1.2 are already built in.

**Do I need an API key?**
No. RetroWeather uses Open-Meteo which is completely free with no account or API key required.

**How do I change my location?**
Right-click the widget and select **Change Location...**. Type any city name or US zip code and it will update automatically.

**Why does the location switcher not work on Windows 7?**
Windows 7 ships with an older version of PowerShell that can't make secure HTTPS connections. Install [WMF 5.1](https://www.microsoft.com/en-us/download/details.aspx?id=54616) to fix this — see the Windows 7 Notes section above.

**Why does it show cloudy when it looks sunny outside?**
Open-Meteo's daily weather code represents the worst condition of the day. Even brief high-altitude clouds or haze can push the code to "cloudy" for the whole day. The current conditions (top of the widget) are more accurate for right now.

**How often does it update?**
Every 5 minutes for weather, wind, and AQI.

**Can I use Celsius?**
Yes — right-click the widget and select **Use Celsius**. Wind speed will automatically switch to km/h. Right-click again and select **Use Fahrenheit** to switch back.

**The widget shows blank/no data after loading.**
Wait about 10–15 seconds for the API calls to complete on first load. If it stays blank, right-click and hit **Refresh weather**.

---
## License

MIT License — free to use, modify, and share.
