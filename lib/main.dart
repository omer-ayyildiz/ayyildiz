import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(const LinktreeCloneApp());

class LinktreeCloneApp extends StatelessWidget {
  const LinktreeCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eugenia | Linktree',
      home: const LinktreePage(),
    );
  }
}

class LinktreePage extends StatelessWidget {
  const LinktreePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black87,
        titleSpacing: 0,
        leadingWidth: 56,
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.arrow_back, size: 24),
              onPressed: () {},
              tooltip: 'Geri',
            ),
            IconButton(
              icon: const Icon(Icons.keyboard_arrow_down, size: 26),
              onPressed: () {},
              tooltip: 'Kapat',
            ),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Eugenia | Linktree',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'linktr.ee',
              style: theme.textTheme.labelMedium?.copyWith(
                color: Colors.black54,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.share), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
          const SizedBox(width: 4),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF6B7C0), Color(0xFFF3A7BC), Color(0xFFEFA0B8)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          top: false,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 32, 20, 24),
            child: Column(
              children: [
                // Profil avatarı
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 140,
                      width: 140,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFC0CB),
                        shape: BoxShape.circle,
                      ),
                    ),
                    CircleAvatar(
                      radius: 52,
                      backgroundColor: Colors.white,
                      backgroundImage: const AssetImage(
                        'assets/avatar_placeholder.png', // yoksa renkli zemin kullanılır
                      ),
                      onBackgroundImageError: (_, __) {},
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Text(
                  'Öjeni',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.merriweather(
                    fontSize: 34,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '⭐ AppVenture Solutions\nolarak ortaklık sunuyoruz 📱',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      height: 1.35,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _roundIconButton(
                      icon: FontAwesomeIcons.whatsapp,
                      onTap: () {},
                    ),
                    const SizedBox(width: 16),
                    _roundIconButton(
                      icon: FontAwesomeIcons.telegram,
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 26),

                // WhatsApp
                LinkPillButton(
                  leading: const FaIcon(FontAwesomeIcons.whatsapp, size: 26),
                  label: 'WhatsApp',
                  onTap: () {},
                ),
                const SizedBox(height: 16),

                // Telgraf (Telegram)
                LinkPillButton(
                  leading: const FaIcon(FontAwesomeIcons.telegram, size: 26),
                  label: 'Telgraf',
                  onTap: () {},
                ),
                const SizedBox(height: 16),

                // Web sitemiz
                LinkPillButton(
                  leading: const Icon(Icons.android, size: 28),
                  label: 'Web sitemiz 💌',
                  onTap: () {},
                ),
                const SizedBox(height: 28),

                // Alt bilgi balonu
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.92),
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.15),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star_rate_rounded, size: 22),
                      const SizedBox(width: 8),
                      Text(
                        'linktr.ee/siz',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.close, size: 18),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  "Linktree'de DevSprout_Eugenia ile katılın",
                  style: GoogleFonts.inter(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _roundIconButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 58,
        height: 58,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.25),
              offset: const Offset(0, 8),
              blurRadius: 16,
            ),
          ],
        ),
        child: Center(child: FaIcon(icon, size: 22, color: Colors.black87)),
      ),
    );
  }
}

class LinkPillButton extends StatelessWidget {
  const LinkPillButton({
    super.key,
    required this.leading,
    required this.label,
    required this.onTap,
  });

  final Widget leading;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // Arka taraftaki kalın siyah gölgeyi taklit etmek için iki katmanlı yapı
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 86,
        child: Stack(
          children: [
            // Siyah “alt katman”
            Positioned(
              left: 10,
              right: 10,
              bottom: 0,
              top: 8,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
            ),
            // Üst beyaz katman
            Positioned.fill(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.10),
                      blurRadius: 14,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 16,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4F4F4),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Center(
                        child: IconTheme(
                          data: const IconThemeData(color: Colors.green),
                          child: leading,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        label,
                        style: GoogleFonts.merriweather(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const Icon(Icons.more_vert, color: Colors.black87),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
