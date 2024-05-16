Region.create([
  { name: 'Temperate Region', climate: 'temperate' },
  { name: 'Arid Region', climate: 'arid' }
])

Plant.create([
  { name: 'Rose', price: 10.00, climate: 'temperate', description: 'A rose is a woody perennial flowering plant of the genus Rosa.', image: 'https://example.com/images/rose.jpg', additional_info: 'Best grown in fertile, well-drained soil with ample sunlight.' },
  { name: 'Cactus', price: 20.00, climate: 'arid', description: 'Cacti are members of the plant family Cactaceae, a family comprising about 127 genera.', image: 'https://example.com/images/cactus.jpg', additional_info: 'Requires minimal water and plenty of sunlight.' }
])
