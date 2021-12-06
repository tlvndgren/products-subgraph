// Dependencies
const fs = require("fs");
const { ApolloServer, gql } = require("apollo-server");
const { buildSubgraphSchema } = require("@apollo/federation")

// Internal imports
const typeDefs = gql(fs.readFileSync("./products.graphql", 'utf8'));
const products = require("./data/products.js");

// Variable Definitions
const port = process.env.PORT || 4001

const resolvers = {
    Product: {
        price(product) {
            return product.prices.find(id => { __typename: "Price", id });
        }
    },
    Query: {
        product(_, { id }) {
            return products.find((product) => product.id === parseInt(id, 10));
        },
        products() {
            return products
        }
    }
};

// Apollo Server Setup
const server = new ApolloServer({
    schema: buildSubgraphSchema([{ typeDefs, resolvers }]),
});
  
server.listen({ port }).then(({ url }) => {
    console.log(`Products service ready at ${url}`);
});
