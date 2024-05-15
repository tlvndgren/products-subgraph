// External Dependencies
import fs from "fs";
import { ApolloServer } from '@apollo/server';
import { buildSubgraphSchema } from "@apollo/subgraph";
import { startStandaloneServer } from '@apollo/server/standalone';
import gql from 'graphql-tag';

// Internal Dependencies
const typeDefs = gql(fs.readFileSync("./products.graphql", 'utf8'));
import { products } from "./data/products.js";

// Variable Definitions
const port = process.env.PORT || 4001

const resolvers = {
    Product: {
        price(product) {
            return { __typename: "Price", id: product.priceId };
        },
        __resolveReference(object) {
            return products.find((product) => product.id === parseInt(object.id, 10));
        },
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
    schema: buildSubgraphSchema({ typeDefs, resolvers }),
});

const { url } = await startStandaloneServer(server, {
    context: async ({ req }) => ({ token: req.headers.token }),
    listen: { port: port },
  });

console.log(`🚀  Prices Subgraph ready at ${url}`);
