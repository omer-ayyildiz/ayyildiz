import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(const LinktreeTidyApp());

class LinktreeTidyApp extends StatelessWidget {
  const LinktreeTidyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eugenia | Linktree',
      home: const LinktreeTidyPage(),
    );
  }
}

class LinktreeTidyPage extends StatelessWidget {
  const LinktreeTidyPage({super.key});

  // Ekrana göre akıllı max genişlik
  double _maxWidthFor(double w) {
    if (w < 600) return 560; // telefon
    if (w < 900) return 720; // küçük tablet
    return 820; // masaüstü
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black87,
        titleSpacing: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Eugenia | Linktree',
              style: GoogleFonts.inter(fontWeight: FontWeight.w700),
            ),
            Text(
              'linktr.ee',
              style: GoogleFonts.inter(fontSize: 12, color: Colors.black54),
            ),
          ],
        ),
        actions: const [
          Icon(Icons.share),
          SizedBox(width: 8),
          Icon(Icons.more_vert),
          SizedBox(width: 8),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF6B7C0), Color(0xFFF3A7BC), Color(0xFFEFA0B8)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final maxWidth = _maxWidthFor(constraints.maxWidth);

            return SingleChildScrollView(
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: maxWidth,
                    // Yükseklik kısa kalırsa alt bandın görünmesi için minHeight
                    minHeight: size.height - kToolbarHeight - 16,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 8),
                        // Avatar + pembe halka
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 120,
                              width: 120,
                              decoration: const BoxDecoration(
                                color: Color(0xFFFFC0CB),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const CircleAvatar(
                              radius: 44,
                              backgroundColor: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Öjeni',
                          style: GoogleFonts.merriweather(
                            fontSize: 36,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '⭐ AppVenture Solutions\nolarak ortaklık sunuyoruz 📱',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            height: 1.35,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _roundIcon(FontAwesomeIcons.whatsapp),
                            const SizedBox(width: 14),
                            _roundIcon(FontAwesomeIcons.telegram),
                          ],
                        ),
                        const SizedBox(height: 22),

                        // Liste alanı (merkezde ve kısıtlı genişlik)
                        _LinkPill(
                          icon: const FaIcon(FontAwesomeIcons.whatsapp),
                          label: 'WhatsApp',
                          onTap: () {},
                        ),
                        const SizedBox(height: 12),
                        _LinkPill(
                          icon: const FaIcon(FontAwesomeIcons.telegram),
                          label: 'Telgraf',
                          onTap: () {},
                        ),
                        const SizedBox(height: 12),
                        _LinkPill(
                          icon: const Icon(Icons.android),
                          label: 'Web sitemiz 💌',
                          onTap: () {},
                        ),
                        const SizedBox(height: 18),

                        // Küçük baloncuk
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.95),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.12),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.star_rate_rounded, size: 18),
                              const SizedBox(width: 6),
                              Text(
                                'linktr.ee/siz',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 6),
                              const Icon(Icons.close, size: 16),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Linktree'de DevSprout_Eugenia ile katılın",
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _roundIcon(IconData icon) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.18),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Center(child: FaIcon(icon, size: 18, color: Colors.black87)),
    );
  }
}

class _LinkPill extends StatelessWidget {
  const _LinkPill({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final Widget icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(28),
        onTap: onTap,
        child: Container(
          // Tam ekranı kaplamasın diye max genişlik üstten zaten sınırlandı.
          height: 68,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.10),
                blurRadius: 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Alt siyah gölge bloğu (hafif)
              Positioned(
                left: 8,
                right: 8,
                bottom: 0,
                top: 6,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
              ),
              // Üst beyaz katman
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4F4F4),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black12),
                        ),
                        child: Center(
                          child: IconTheme(
                            data: const IconThemeData(color: Colors.green),
                            child: icon,
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Text(
                          label,
                          style: GoogleFonts.merriweather(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                          overflow: TextOverflow.ellipsis,
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
      ),
    );
  }
}
