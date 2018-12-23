const defaultData = [
  {
    id: 1,
    name: 'Luke SkyWaler',
    gender: 'male',
    homeworld: 'Tattoine'
  },
  {
    id: 2,
    name: 'C-3PO',
    gender: 'bot',
    homeworld: 'Tattoine'
  }
];

const resolvers = {
  Query: {
    allPeople: () => {
      return defaultData;
    },
    person: (root, { id }) => {
      return defaultData.find(character => character.id === id) || null;
    }
  }
};

export default resolvers;
