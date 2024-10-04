# Oppgavesett: Interaktiv Online CV Webapplikasjon: `Debugging & Testing`

## Innføring i `Jest` og `Debugging` teknikker

**Mål:** Introduser logging for å spore hendelser i applikasjonen.

**Beskrivelse:**  
Introduser `console.log()`-utsagn i CV-applikasjonen din for å spore verdien av variabler på viktige tidspunkter, for eksempel når brukeren legger til eller sletter en erfaring eller ferdighet.  
**Eksempel:** Når en bruker prøver å legge til en ny ferdighet i CV-en sin, logger du tidspunktet og selve ferdigheten for å bekrefte at den blir lagt til som forventet.  
[Se et eksempel her](https://developer.mozilla.org/en-US/docs/Web/API/Console/log)


### Oppgave 2: Jest Grunnleggende - Testing av Funksjoner

**Mål:** Test funksjoner som hjelper med å formatere data for CV-appen.

**Beskrivelse:**  
Tenk deg at du har en funksjon som formaterer telefonnummeret for CV-en. Den skal sørge for at alle telefonnumre har en bestemt format, for eksempel +47-12345678.  
Skriv en Jest-test for å bekrefte at funksjonen riktig formaterer ulike varianter av telefonnumre til ønsket format.  
[Link: Telefonnummer formatering med Jest](https://jestjs.io/docs/getting-started)

### Oppgave 3: Testing av Data Manipulering

**Mål:** Test funksjoner som legger til eller fjerner ferdigheter fra CV-en.

**Beskrivelse:**  
I CV-appen kan brukere legge til ferdigheter. Tenk deg at du har en funksjon som tar en ferdighet og legger den til en liste.  
Skriv en Jest-test for å sjekke at når en ferdighet legges til, er den faktisk lagt til i listen. Du bør også teste hva som skjer hvis brukeren prøver å legge til en tom ferdighet eller en ferdighet som allerede er på listen.  
[Link: Teste arrays og iterables med Jest](https://jestjs.io/docs/tutorial-async)

### Oppgave 4: Testing av UI-komponenter med Jest

**Mål:** Bli kjent med hvordan du kan bruke Jest for å teste interaktive aspekter av CV-appen.

**Beskrivelse:**  
Tenk deg at du har en knapp i CV-appen som, når den blir klikket, åpner et vindu eller en modal der brukere kan redigere sin erfaring.  
Skriv en Jest-test som simulerer et klikk på denne knappen og bekrefter at redigeringsvinduet faktisk åpnes.  
[Link: Simuler events med Jest og @testing-library/react](https://testing-library.com/docs/dom-testing-library/api-events/)

### Oppgave 5: Snapshot Testing

**Mål:** Forstå grunnprinsippene for snapshot testing og hvordan det kan brukes for å sikre at UI ikke endres utilsiktet.

**Beskrivelse:**  
I CV-appen, tenk deg at du har en komponent som viser brukerens utdanningshistorikk.  
Skriv en Jest snapshot-test for denne komponenten for å sikre at den ikke endres utilsiktet i fremtidige oppdateringer av koden.  
[Link: Snapshot Testing med Jest](https://jestjs.io/docs/snapshot-testing)

### Oppgave 6: Simulering av Brukerinteraksjon med End-to-End Testing

**Mål:** Simulere brukerinteraksjon fra start til slutt.

**Beskrivelse:**  
Ved hjelp av et verktøy som Cypress, skriv tester som simulerer hvordan en bruker vil interagere med CV-applikasjonen din fra start til slutt. Dette kan inkludere å legge til en ny erfaring, redigere en eksisterende ferdighet, eller slette en del av CV-en.  
**Eksempel:** Simuler en bruker som legger til en ny jobberfaring, deretter redigerer tittelen på den jobben, og til slutt sletter hele jobberfaringen.  
[Se et eksempel her](https://www.cypress.io/)

### Oppgave 7: Integrasjonstesting

**Mål:** Teste hvordan ulike deler av applikasjonen din fungerer sammen.

**Beskrivelse:**  
Utform tester som bekrefter hvordan ulike deler av applikasjonen din fungerer sammen, for eksempel hvordan data flyter fra en brukerinput til en visning på skjermen.  
**Eksempel:** Etter at en bruker har lagt til tre forskjellige ferdigheter, test for å bekrefte at de alle vises riktig på den genererte CV-siden.  
[Se et eksempel her](https://jestjs.io/docs/en/testing-frameworks)

### Oppgave 8: Feilsøking ved Bruk av Breakpoints

**Mål:** Forstå dataflyten og identifisere eventuelle feil.

**Beskrivelse:**  
Identifiser en funksjon i CV-applikasjonen din hvor du er usikker på dataflyten eller resultatet. Bruk breakpoints i din kode for å pause utførelsen på nøkkelpunkter og inspisere dataene. Dette vil hjelpe deg med å forstå hva som skjer i funksjonen og hvor eventuelle feil kan være.  
**Eksempel:** Hvis du merker at når brukeren prøver å legge til en ny utdanning, men graden ikke vises som forventet på den genererte CV-en, kan breakpoints brukes for å sjekke nøyaktig hvor problemet starter.  
[Se et eksempel her](https://developer.chrome.com/docs/devtools/javascript/breakpoints/)


## Innføring i `PropTypes` & `TypeScript`

### **Oppgave 1: Intro til PropTypes**

**Mål:** Bli kjent med PropTypes for typechecking før vi dykker dypere inn i TypeScript.

**Beskrivelse:**  
Opprett en React-komponent `Profile` som viser grunnleggende brukerinformasjon. Bruk PropTypes for å sikre at `Profile` tar inn følgende props:
- `name`: en streng
- `age`: et nummer
- `experience`: en array av objekter, hvor hvert objekt har en `title` (streng) og `years` (nummer).

**Link:** [PropTypes documentation](https://reactjs.org/docs/typechecking-with-proptypes.html)

### **Oppgave 2: Integrering av TypeScript i et eksisterende React-prosjekt**

**Mål:** Integrer TypeScript i et eksisterende React JS-prosjekt for CV-applikasjonen.

**Beskrivelse:**  
Ta et eksisterende React JS-prosjekt for CV-applikasjonen og integrer TypeScript. Dette innebærer å installere nødvendige avhengigheter, konfigurere tsconfig, og endre noen av de eksisterende React JS-komponentene til TypeScript-komponenter.

**Link:** [Adding TypeScript to an Existing Project](https://www.typescriptlang.org/docs/handbook/migrating-from-javascript.html)

### **Oppgave 3: Utforsking av TypeScript Typer**

**Mål:** Bli kjent med grunnleggende TypeScript typer.

**Beskrivelse:**  
For CV-applikasjonen, endre `Profile` komponenten du lagde i Oppgave 1 for å bruke TypeScript. Definer typer for props `name`, `age`, og `experience`. Forsikre deg om at du bruker riktige typer som `string`, `number`, `array`, etc.

**Link:** [TypeScript Basic Types](https://www.typescriptlang.org/docs/handbook/basic-types.html)

### **Oppgave 4: Grensesnitt (Interfaces) i TypeScript**

**Mål:** Utforske hvordan grensesnitt kan brukes til å strukturere data i TypeScript.

**Beskrivelse:**  
Utvid CV-applikasjonen ved å legge til en ny komponent `WorkExperience` som viser brukerens arbeidserfaring. Bruk TypeScript grensesnitt for å definere typene av data som komponenten tar imot. Dette kan inkludere `jobTitle`, `companyName`, `startYear`, `endYear`, etc.

**Link:** [TypeScript Interfaces](https://www.typescriptlang.org/docs/handbook/interfaces.html)

### **Oppgave 5: Bruk av Type Assertions**

**Mål:** Forstå hvordan og når du skal bruke type assertions i TypeScript.

**Beskrivelse:**  
I CV-applikasjonen, opprett en hjelpefunksjon `parseUserData` som tar en streng (JSON format) og konverterer den til et objekt. Bruk type assertions for å forsikre TypeScript at den returnerte verdien er av en spesifikk type (f.eks. `UserProfile` type).

**Link:** [TypeScript Type Assertions](https://www.typescriptlang.org/docs/handbook/basic-types.html#type-assertions)

### **Oppgave 6: Union Typer og Literal Typer**

**Mål:** Utforske hvordan union typer og literal typer kan være nyttige i CV-applikasjonen.

**Beskrivelse:**  
Lag en komponent `Filter` i CV-applikasjonen som lar brukere filtrere jobberfaring basert på jobbtittel eller årstall. Denne komponenten skal ha en prop som bestemmer hvilken type filter den skal bruke. Bruk union typer for å definere denne propen som enten en streng (jobbtittel) eller et nummer (årstall). Bruk også literal typer for å sikre at den aksepterte strengen er en av forhåndsdefinerte jobbtitler.

**Link:** [TypeScript Union and Literal Types](https://www.typescriptlang.org/docs/handbook/unions-and-intersections.html)

## Ekstra utfordringsoppgaver:

### **Oppgave 7: Generiske Typer**

**Mål:** Utforske dypere bruken av generiske typer i TypeScript.

**Beskrivelse:**  
Lag en generisk funksjon `getDetails` som tar en array av objekter og en nøkkel som en streng. Denne funksjonen skal returnere en ny array med verdiene tilhørende den nøkkelen fra hvert objekt. For eksempel, hvis den mottar en array av jobberfaringer og nøkkelen 'jobTitle', skal den returnere en array av jobbtitlene.

**Link:** [TypeScript Handbook: Generics](https://www.typescriptlang.org/docs/handbook/generics.html)
