import { Given, When, Then, And} from "cypress-cucumber-preprocessor/steps";

const url = 'http://localhost:3000'

Given('I open Example page', () => {
  cy.visit(url)
});

Then('I see {string} in the title', (title) => {
  cy.title().should('eq', title)
});

And('I input {string} into the name field', (name) => {
  if (name)
    cy.get('#name').type(name);
});

And('I input {string} into the class year field', (classYear) => {
  if (classYear)
    cy.get('#classYear').type(classYear);
});

And('I input {string} into the weekday field', (weekday) => {
  if (weekday)
    cy.get('#weekday').type(weekday);
});

And('I input {string} into the email field', (email) => {
  if (email)
    cy.get('#email').type(email);
});

And('I input {string} into the password field', (password) => {
  if (password)
    cy.get('#password').type(password);
});

And('I input {string} into the confirm password field', (confirmPassword) => {
  if (confirmPassword)
    cy.get('#confirmPassword').type(confirmPassword);
});

Then('the submission is successful', () => {  
  const stub = cy.stub()  
  cy.on ('window:alert', stub)
  cy.get('#signup-btn').click()
  .then(() => {
    expect(stub.getCall(0)).to.be.calledWith('Your submission was successful')      
  })    
});

When('I hit submit button', () => {  
  cy.get('#signup-btn').click();
});

Then('there are {int} errors displayed', (errorCount) => {  
  cy.get("#errors").children().should('have.length', errorCount);
});