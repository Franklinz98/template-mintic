import './widgets/offer_card.dart';
import 'package:flutter/material.dart';

class PublicOffers extends StatelessWidget {
  // PublicOffes empty constructor
  PublicOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // OfferCard usage example
        OfferCard(
          title: 'Desarrollador backend de NodeJs',
          content:
              'Estamos buscando un desarrollador backend independiente de NodeJS para trabajar en el backend de una aplicación nativa de Android. Alguien que pueda ayudarnos en la creación de una aplicación móvil de redes sociales basada en video desde cero. Este sería un puesto remunerado con la opción de trabajar desde casa. Una oportunidad de aprender y desarrollar algo desde cero.',
          arch: 'Android',
          level: 'Experto',
          payment: 3000000,
          onCopy: () => {},
          onApply: () => {},
        ),
      ],
    );
  }
}
