const fs = require("fs");
const { ApolloServer, gql } = require("apollo-server");
const { buildSubgraphSchema } = require("@apollo/federation")
const typeDefs = gql(fs.readFileSync("./products.graphql", 'utf8'));
const products = require("./data/products.js");

const port = process.env.PORT || 4002

const resolvers = {
    // Product: {
    //     __resolverReference(object) {
    //         return products.find((product) => product.id === object.id);
    //     },
    // },
    Query: {
        product(_, { id }) {
            return products.find((product) => product.id === parseInt(id, 10));
        },
        products() {
            return products
        }
    }
};

const server = new ApolloServer({
    schema: buildSubgraphSchema([{ typeDefs, resolvers }]),
  });
  
  server.listen({ port }).then(({ url }) => {
    console.log(`Products service ready at ${url}`);
  });
