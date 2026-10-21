import '../models/destination.dart';

/// The destinations bundled with the app. All photography comes from
/// Wikimedia Commons, so the app works without any API keys.
const List<Destination> destinations = [
  Destination(
    id: 'goa',
    name: 'Goa',
    location: 'Goa, India',
    category: DestinationCategory.beaches,
    imageUrl: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/9c/Palolem_Beach%2C_South_Goa.jpg/960px-Palolem_Beach%2C_South_Goa.jpg',
    shortDescription: 'Palm-lined beaches, Portuguese old quarters and unhurried coastal days.',
    description:
        'Goa is India\'s favourite coastline, where long golden beaches meet a '
        'slow, sea-salt rhythm of life. Days drift between swimming at Palolem, '
        'spiced fish curry at a beach shack and cycling through coconut groves, '
        'while evenings bring candle-lit dinners along the sand. Beyond the '
        'beaches, whitewashed churches and bright Latin quarters in Old Goa '
        'tell four centuries of Portuguese history, making this much more than '
        'a sun-and-sand stop.',
    bestTimeToVisit: 'November to February',
    attractions: [
      Attraction(
        name: 'Palolem Beach',
        imageUrl: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/9c/Palolem_Beach%2C_South_Goa.jpg/960px-Palolem_Beach%2C_South_Goa.jpg',
      ),
      Attraction(
        name: 'Basilica of Bom Jesus',
        imageUrl: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/9e/Front_Elevation_of_Basilica_of_Bom_Jesus.jpg/960px-Front_Elevation_of_Basilica_of_Bom_Jesus.jpg',
      ),
      Attraction(
        name: 'Anjuna Beach',
        imageUrl: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/cf/Anjuna_Beach%2C_Goa%2C_India%2C_Legendary_Curlies_beach_shack.jpg/960px-Anjuna_Beach%2C_Goa%2C_India%2C_Legendary_Curlies_beach_shack.jpg',
      ),
    ],
  ),
  Destination(
    id: 'varkala',
    name: 'Varkala',
    location: 'Kerala, India',
    category: DestinationCategory.beaches,
    imageUrl: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/49/Varkala_Beach%2C_Varkala%2C_Kerala.jpg/960px-Varkala_Beach%2C_Varkala%2C_Kerala.jpg',
    shortDescription:
        'A dramatic red cliff rising straight out of the Arabian Sea.',
    description:
        'Varkala is Kerala at its most cinematic: a ribbon of red laterite '
        'cliff hovering over the Arabian Sea, with cafés, curio shops and yoga '
        'schools spilling along its edge. Below the cliff runs a long golden '
        'beach where waves are steady enough for bodysurfing and sunset walks '
        'stretch for kilometres. It is one of the few places in South India '
        'where you can watch the sun sink into the ocean from a cliff-top '
        'table.',
    bestTimeToVisit: 'October to March',
    attractions: [
      Attraction(
        name: 'Papanasam Beach',
        imageUrl: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/e0/Varkala_beach_from_above.jpg/960px-Varkala_beach_from_above.jpg',
      ),
      Attraction(
        name: 'The Cliff Promenade',
        imageUrl: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/49/Varkala_Beach%2C_Varkala%2C_Kerala.jpg/960px-Varkala_Beach%2C_Varkala%2C_Kerala.jpg',
      ),
    ],
  ),
  Destination(
    id: 'manali',
    name: 'Manali',
    location: 'Himachal Pradesh, India',
    category: DestinationCategory.mountains,
    imageUrl: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/03/Manali_City.jpg/960px-Manali_City.jpg',
    shortDescription:
        'Cedar forests, snow peaks and a lively Himalayan valley town.',
    description:
        'Manali sits at the head of the Kullu Valley, wrapped in deodar forest '
        'and framed by snow peaks. It is a basecamp for High Himalayan '
        'adventures, with paragliding over green meadows at Solang and the '
        'road to Rohtang climbing into a world of grey moraine and ice. In '
        'town, Hadimba\'s ancient cedar-wood temple and cafés along the Beas '
        'river give quieter evenings after mountain days.',
    bestTimeToVisit: 'March to June for summer; December to January for snow',
    attractions: [
      Attraction(
        name: 'Solang Valley',
        imageUrl: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f1/Solang_Valley_%2CManali%2C_Himachal_Pardes%2C_India.JPG/960px-Solang_Valley_%2CManali%2C_Himachal_Pardes%2C_India.JPG',
      ),
      Attraction(
        name: 'Rohtang Pass',
        imageUrl: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/a/a2/Kullu_Valley_from_Rohtang_Pass%2C_India.jpg/960px-Kullu_Valley_from_Rohtang_Pass%2C_India.jpg',
      ),
      Attraction(
        name: 'Hadimba Devi Temple',
        imageUrl: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/99/Hidimba_Devi_Temple_-_North-east_View_-_Manali_2014-05-11_2648-2649.TIF/lossy-page1-960px-Hidimba_Devi_Temple_-_North-east_View_-_Manali_2014-05-11_2648-2649.TIF.jpg',
      ),
    ],
  ),
  Destination(
    id: 'shimla',
    name: 'Shimla',
    location: 'Himachal Pradesh, India',
    category: DestinationCategory.mountains,
    imageUrl: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/ba/Landscape_of_Shimla_%2C_Himachal_Pradesh.jpg/960px-Landscape_of_Shimla_%2C_Himachal_Pradesh.jpg',
    shortDescription: 'Colonial-era promenades and pine ridges with views across the Himalaya.',
    description:
        'Shimla was the summer capital of British India, and its legacy reads '
        'in every crooked lane: Jacobean churches, a half-timbered theatre and '
        'malls that run along a ridge 2,200 metres up. Walk The Ridge and '
        'Mall Road at golden hour, ride the UNESCO-listed Kalka–Shimla toy '
        'train through 800 bridges and tunnels, and look north towards '
        'endless white ridgelines on clear days.',
    bestTimeToVisit: 'March to June; December for snowfall',
    attractions: [
      Attraction(
        name: 'The Ridge & Mall Road',
        imageUrl: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/25/The_Ridge_Shimla_5.jpg/960px-The_Ridge_Shimla_5.jpg',
      ),
      Attraction(
        name: 'Christ Church',
        imageUrl: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/fd/Christ_Church%2C_Shimla.jpg/960px-Christ_Church%2C_Shimla.jpg',
      ),
      Attraction(
        name: 'Kalka–Shimla Toy Train',
        imageUrl: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/d/d9/KSR_Steam_special_at_Taradevi_05-02-13_56.jpeg/960px-KSR_Steam_special_at_Taradevi_05-02-13_56.jpeg',
      ),
    ],
  ),
  Destination(
    id: 'jaipur',
    name: 'Jaipur',
    location: 'Rajasthan, India',
    category: DestinationCategory.heritage,
    imageUrl: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/3/37/Hawa_Mahal_2011.jpg/960px-Hawa_Mahal_2011.jpg',
    shortDescription:
        'Pink-city palaces, honeycomb façades and Rajput grandeur.',
    description:
        'Jaipur, the Pink City, reads like a fort-and-palace manifesto of the '
        'Rajput kingdom of Amber. Climb to Amber Fort\'s mirrored halls, '
        'marvel at Hawa Mahal\'s 953 windows built for royal women to watch '
        'street festivals unseen, and watch Jal Mahal float mid-lake on '
        'Man Sagar. Bazaars of block-printed textiles, gemstone workshops and '
        'kite-fighting rooftops keep the old city humming after dark.',
    bestTimeToVisit: 'October to March',
    attractions: [
      Attraction(
        name: 'Hawa Mahal',
        imageUrl: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/3/37/Hawa_Mahal_2011.jpg/960px-Hawa_Mahal_2011.jpg',
      ),
      Attraction(
        name: 'Amber Fort',
        imageUrl: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/23/Amber_Fort.jpg/960px-Amber_Fort.jpg',
      ),
      Attraction(
        name: 'Jal Mahal',
        imageUrl: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/ff/Jaipur_03-2016_39_Jal_Mahal_-_Water_Palace.jpg/960px-Jaipur_03-2016_39_Jal_Mahal_-_Water_Palace.jpg',
      ),
    ],
  ),
  Destination(
    id: 'hampi',
    name: 'Hampi',
    location: 'Karnataka, India',
    category: DestinationCategory.heritage,
    imageUrl: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/1f/Hampi%2C_India.jpg/960px-Hampi%2C_India.jpg',
    shortDescription: 'A fallen empire of stone temples scattered over a boulder-strewn valley.',
    description:
        'Hampi was the capital of the Vijayanagara empire and, at its height '
        'around 1500, one of the largest cities in the world. Today its ruins '
        '— the carved Vittala temple with its stone chariot, the Virupaksha '
        'temple still in active worship, royal stables and sunken market streets — '
        'sit in a surreal landscape of giant ochre boulders and banana plantations. '
        'Sunrise from Matanga Hill maps the whole lost city at once.',
    bestTimeToVisit: 'November to February',
    attractions: [
      Attraction(
        name: 'Virupaksha Temple',
        imageUrl: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/8/89/Virupaksha_Temple%2C_Hampi.jpg/960px-Virupaksha_Temple%2C_Hampi.jpg',
      ),
      Attraction(
        name: 'Stone Chariot, Vittala Temple',
        imageUrl: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/04/Stone_Chariot%2C_Vittala_Temple.jpg/960px-Stone_Chariot%2C_Vittala_Temple.jpg',
      ),
      Attraction(
        name: 'Elephant Stables',
        imageUrl: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/1b/Elephant_stables%2C_Hampi.jpg/960px-Elephant_stables%2C_Hampi.jpg',
      ),
    ],
  ),
  Destination(
    id: 'rishikesh',
    name: 'Rishikesh',
    location: 'Uttarakhand, India',
    category: DestinationCategory.adventure,
    imageUrl: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/74/Trayambakeshwar_Temple_VK.jpg/960px-Trayambakeshwar_Temple_VK.jpg',
    shortDescription:
        'Ganges rapids, suspension bridges and evening aarti on the riverbank.',
    description:
        'Rishikesh sits where the Ganges leaves the mountains for the plains, '
        'and it has adopted a second identity as India\'s adventure capital: '
        'Grade III-IV rafting runs through forested canyons, cliff-jumping '
        'spots line the banks and camping is done to the sound of the river. '
        'Between the adrenaline, suspension bridges crowded with langurs, '
        'hillside temples and a nightly aarti of fire and song on the ghats '
        'give the town its deep, spiritual undertow.',
    bestTimeToVisit: 'September to November; March to May',
    attractions: [
      Attraction(
        name: 'Lakshman Jhula',
        imageUrl: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/74/Trayambakeshwar_Temple_VK.jpg/960px-Trayambakeshwar_Temple_VK.jpg',
      ),
      Attraction(
        name: 'Ram Jhula',
        imageUrl: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/11/Ramjhula_-_bridge_over_the_Ganga.jpg/960px-Ramjhula_-_bridge_over_the_Ganga.jpg',
      ),
      Attraction(
        name: 'Triveni Ghat',
        imageUrl: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/08/Triveni_Ghat_Krishna_Arjun_Rath.jpg/960px-Triveni_Ghat_Krishna_Arjun_Rath.jpg',
      ),
    ],
  ),
  Destination(
    id: 'spiti-valley',
    name: 'Spiti Valley',
    location: 'Himachal Pradesh, India',
    category: DestinationCategory.adventure,
    imageUrl: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/3/3f/Spiti_River_Kaza_Himachal_Jun18_D72_7232.jpg/960px-Spiti_River_Kaza_Himachal_Jun18_D72_7232.jpg',
    shortDescription: 'High-altitude desert with thousand-year-old monasteries above the clouds.',
    description:
        'Spiti is a cold desert sitting upside down between Tibet and the '
        'rest of India: fossil beds, turquoise high lakes and villages pinned '
        'to barren slopes. The valley\'s monasteries — thousand-year-old Key '
        'perched like a fortress, Dhankar teetering on a mud cliff, Tabo\'s '
        'frescoed chapels called the Ajanta of the Himalaya — anchor a '
        'journey for travellers who want altitudes above 4,000 metres and '
        'silence large enough to hear the river from the road.',
    bestTimeToVisit: 'May to mid-October',
    attractions: [
      Attraction(
        name: 'Key Monastery',
        imageUrl: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/49/1000_Year_loop.jpg/960px-1000_Year_loop.jpg',
      ),
      Attraction(
        name: 'Chandra Taal Lake',
        imageUrl: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/3/3a/Chandratal_1.JPG/960px-Chandratal_1.JPG',
      ),
      Attraction(
        name: 'Dhankar Monastery',
        imageUrl: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/3/35/Dhankar_Gompa_and_village.jpg/960px-Dhankar_Gompa_and_village.jpg',
      ),
    ],
  ),
];

/// Finds the first destination whose [id] matches, or null.
Destination? destinationById(String id) {
  for (final destination in destinations) {
    if (destination.id == id) return destination;
  }
  return null;
}

/// Resolves wishlist IDs to full destinations, keeping only valid ids.
List<Destination> destinationsByIds(Iterable<String> ids) {
  final result = <Destination>[];
  for (final id in ids) {
    final destination = destinationById(id);
    if (destination != null) result.add(destination);
  }
  return result;
}

/// Searches [source] by name (case-insensitive) and filters by [category].
/// A null [category] or an empty/blank [query] means "no restriction", so
/// both constraints can be combined freely.
List<Destination> filterDestinations(
  List<Destination> source, {
  String query = '',
  DestinationCategory? category,
}) {
  final normalisedQuery = query.trim().toLowerCase();
  return source.where((destination) {
    if (category != null && destination.category != category) return false;
    if (normalisedQuery.isEmpty) return true;
    return destination.name.toLowerCase().contains(normalisedQuery);
  }).toList();
}
