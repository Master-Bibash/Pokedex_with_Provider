import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/HomePage/HomeComponents/widgets/PokeNews.dart';

List<Map<String, dynamic>> pokedexMenuItems = [
  {
    "label": "Pokedex",
    "color": const Color(0xFF4FC1A6),
    "route":"/pokedex-screen"
  },
  {
    "label": "Moves",
    "color": const Color(0xFFf7796b),
        "route": "/pokedex-screen"

  },
  {
    "label": "Abilities",
    "color": const Color(0xFF58AAF6),
        "route": "/pokedex-screen"

  },
  {
    "label": "Items",
    "color": const Color(0xFFFFCE4B),
        "route": "/pokedex-screen"

  },
  {
    "label": "Locations",
    "color": const Color(0xFF7C538C),
        "route": "/pokedex-screen"

  },
  {
    "label": "Type Chart",
    "color": const Color(0xFFB1736C),
        "route": "/pokedex-screen"

  },
];

List<PokedexNews> pokeNews = [
  const PokedexNews(
    img:
        'https://upload.wikimedia.org/wikipedia/en/thumb/f/f8/Pokemon_Rumble_Rush.jpg/330px-Pokemon_Rumble_Rush.jpg',
    subtitle: "15 May 2019",
    title: "Pokemon Rumble Rush\n Arrives Soon",
  
  ),
    const PokedexNews(
    img:
        'https://pokemongohub.net/wp-content/uploads/2018/11/detective_pikachu.0.jpg',
    subtitle: "27 March, 2019",
    title: "Pokémon Cinematic Universe Possibly in the Works After Detective Pikachu",
  ),
    const PokedexNews(
    img:
        'https://static1.colliderimages.com/wordpress/wp-content/uploads/2022/08/Pok%C3%A9mon-the-movie-destiny-deoxys.jpg?q=50&fit=crop&w=1500&dpr=1.5',
    subtitle: " 21 Oct, 2023",
    title: "'Pokémon the Movie: Destiny Deoxys' (2004)",
  ),
   const PokedexNews(
    img:
        'https://static1.colliderimages.com/wordpress/wp-content/uploads/2022/08/Pok%C3%A9mon-the-movie-destiny-deoxys.jpg?q=50&fit=crop&w=1500&dpr=1.5',
    subtitle: " 21 Oct, 2023",
    title: "'Pokémon the Movie: Destiny Deoxys' (2004)",
  ),
   const PokedexNews(
    img:
        'https://upload.wikimedia.org/wikipedia/en/thumb/f/f8/Pokemon_Rumble_Rush.jpg/330px-Pokemon_Rumble_Rush.jpg',
    subtitle: "15 May 2019",
    title: "Pokemon Rumble Rush\n Arrives Soon",
  ),
  const PokedexNews(
    img:
        'https://pokemongohub.net/wp-content/uploads/2018/11/detective_pikachu.0.jpg',
    subtitle: "27 March, 2019",
    title:
        "Pokémon Cinematic Universe Possibly in the Works After Detective Pikachu",
  ),
  const PokedexNews(
    img:
        'https://static1.colliderimages.com/wordpress/wp-content/uploads/2022/08/Pok%C3%A9mon-the-movie-destiny-deoxys.jpg?q=50&fit=crop&w=1500&dpr=1.5',
    subtitle: " 21 Oct, 2023",
    title: "'Pokémon the Movie: Destiny Deoxys' (2004)",
  ),
  const PokedexNews(
    img:
        'https://static1.colliderimages.com/wordpress/wp-content/uploads/2022/08/Pok%C3%A9mon-the-movie-destiny-deoxys.jpg?q=50&fit=crop&w=1500&dpr=1.5',
    subtitle: " 21 Oct, 2023",
    title: "'Pokémon the Movie: Destiny Deoxys' (2004)",
  ),
];
