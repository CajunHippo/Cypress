import { Given, Then } from "cypress-cucumber-preprocessor/steps";

const url = 'http://localhost:3000'
Given('I open Example page', () => {
  cy.visit(url)
});

Then('I see (.*) in the title', (title) => {
  cy.title().should('eq', title)
});