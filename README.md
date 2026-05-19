# Real Reverse Toolkit 🌐

<div dir="rtl">

## الوصف

تطبيق Android حقيقي للهندسة العكسية يعمل مع Termux. يوفر أدوات حقيقية غير محاكاة للتعامل مع ملفات APK والتطبيقات.

## المميزات

### الأدوات المتاحة:
- **APKTool** - فك وتعديل وبناء ملفات APK
- **Frida** - الحقن الديناميكي وتتبع التطبيقات
- **ApkSigner** - توقيع والتحقق من ملفات APK
- **Zipalign** - تحسين ملفات APK
- **Baksmali/Smali** - فك وتجميع DEX
- **YARA** - مسح الأنماط malware

### ما يجعله حقيقياً:
✅ يعمل مع أوامر Termux الحقيقية
✅ لا يوجد محاكاة - كل شيء ينفذ على جهازك
✅ واجهة عربية احترافية
✅ يتحكم بأدوات النظام مباشرة

## التثبيت

### 1. تثبيت الأدوات في Termux

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/alhsryahmd266-jpg/RealReverseToolkit/main/install_tools.sh)"
```

### 2. تشغيل التطبيق

افتح التطبيق واتصل بـ Termux لبدء استخدام الأدوات.

## الاستخدام

### فك APK:
```bash
apktool d file.apk -o output/
```

### بناء APK:
```bash
apktool b folder/ -o new.apk
```

### توقيع APK:
```bash
apksigner sign --ks key.keystore --out signed.apk unsigned.apk
```

### Frida:
```bash
frida-ps -U
objection -g com.example.app explore
```

## التطبيق جاهز للاستخدام مع أقوى أدوات الهندسة العكسية في العالم! 🔧

</div>

## Building

```bash
npm install
npm run build
npm run build:android
```

## License

MIT License - للأدوات القانونية فقط ⚖️