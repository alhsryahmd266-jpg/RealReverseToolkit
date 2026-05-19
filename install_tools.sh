# Real Reverse Engineering Toolkit
# Android App with Termux Integration

# Install this script in Termux to enable full reverse engineering capabilities

#!/bin/bash

echo "=============================================="
echo "  REAL REVERSE ENGINEERING TOOLKIT"
echo "  Installing Tools..."
echo "=============================================="

# Update Termux
pkg update && pkg upgrade -y

# Install Java JDK
pkg install openjdk-17 -y

# Install Python and pip
pkg install python -y
pkg install python-pip -y

# Install essential tools
pkg install wget -y
pkg install curl -y
pkg install git -y
pkg install unzip -y
pkg install zip -y
pkg install bash -y

# ============ APKTOOL ============
echo "[1/6] Installing APKTool..."
if [ ! -f ~/../usr/bin/apktool ]; then
    wget -q -O ~/apktool.jar https://github.com/iBotPeaches/Apktool/releases/download/v2.9.3/apktool_2.9.3.jar
    cat > ~/../usr/bin/apktool << 'EOF'
#!/bin/bash
java -jar ~/apktool.jar "$@"
EOF
    chmod +x ~/../usr/bin/apktool
    chmod +x ~/apktool.jar
fi

# ============ APKTOOL WRAPPER ============
cat > ~/../usr/bin/apktool << 'EOF'
#!/bin/bash
export PATH="$HOME:$PATH"
cd ~/reverse_workspace
java -jar ~/apktool.jar "$@"
EOF
chmod +x ~/../usr/bin/apktool

# ============ BAKSMALI ============
echo "[2/6] Installing baksmali..."
wget -q -O ~/baksmali.jar https://github.com/JesusFreke/smali/releases/download/v2.5.2/baksmali-2.5.2.jar

cat > ~/../usr/bin/baksmali << 'EOF'
#!/bin/bash
java -jar ~/baksmali.jar "$@"
EOF
chmod +x ~/../usr/bin/baksmali

# ============ SMALI ============
echo "[3/6] Installing smali..."
wget -q -O ~/smali.jar https://github.com/JesusFreke/smali/releases/download/v2.5.2/smali-2.5.2.jar

cat > ~/../usr/bin/smali << 'EOF'
#!/bin/bash
java -jar ~/smali.jar "$@"
EOF
chmod +x ~/../usr/bin/smali

# ============ APKSIGNER ============
echo "[4/6] Installing ApkSigner..."
if [ ! -d ~/apksigner ]; then
    mkdir -p ~/apksigner
    wget -q -O ~/apksigner.zip https://github.com/patrickfav/uber-apk-signer/releases/download/v1.3.0/uber-apk-signer-1.3.0.jar
    mv ~/apksigner.zip ~/apksigner/uber-apk-signer.jar
fi

cat > ~/../usr/bin/apksigner << 'EOF'
#!/bin/bash
java -jar ~/apksigner/uber-apk-signer.jar "$@"
EOF
chmod +x ~/../usr/bin/apksigner

# ============ ZIPALIGN ============
echo "[5/6] Installing Zipalign..."
if [ ! -f ~/../usr/bin/zipalign ]; then
    wget -q -O ~/zipalign https://raw.githubusercontent.com/nicokosi/AndroidTools/master/zipalign
    chmod +x ~/zipalign
    mv ~/zipalign ~/../usr/bin/zipalign
fi

# ============ PYTHON TOOLS ============
echo "[6/6] Installing Python tools..."
pip install --upgrade pip
pip install androguard frida-tools objection yara-python

# ============ CREATE WORKSPACE ============
mkdir -p ~/reverse_workspace/{apk_files,decompiled,modified,output,quarantine}

# ============ JADX INSTALLER ============
cat > ~/../usr/bin/jadx-gui << 'EOF'
#!/bin/bash
echo "Jadx requires GUI. Run: cd ~/jadx && ./gradlew run"
EOF
chmod +x ~/../usr/bin/jadx-gui

echo ""
echo "=============================================="
echo "  INSTALLATION COMPLETE!"
echo "=============================================="
echo ""
echo "AVAILABLE COMMANDS:"
echo ""
echo "  apktool d <file.apk> -o <output/>"
echo "      → Decompile APK"
echo ""
echo "  apktool b <folder/> -o <output.apk>"
echo "      → Rebuild APK"
echo ""
echo "  apksigner sign --ks <key.keystore> --out <signed.apk> <unsigned.apk>"
echo "      → Sign APK"
echo ""
echo "  zipalign -v 4 <input.apk> <output.apk>"
echo "      → Align APK"
echo ""
echo "  frida-ps -U"
echo "      → List running apps (USB)"
echo ""
echo "  objection -g <package> explore"
echo "      → Explore app memory"
echo ""
echo "WORKSPACE: ~/reverse_workspace/"
echo ""
echo "=============================================="