### **Oppgave 4: Feilsøking i TypeScript**

**Mål:** Lære å identifisere og rette opp feil i TypeScript-kode.

**Beskrivelse:**  
I denne oppgaven skal du feilsøke en `Profile`-komponent som er skrevet i TypeScript. Koden har en feil som forhindrer den fra å fungere som forventet. Din oppgave er å finne og rette opp feilen. Koden skal vise brukerens navn, alder og arbeidserfaring.

**Link:** [TypeScript Error Handling](https://www.typescriptlang.org/docs/handbook/basic-types.html)

> [!NOTE]  
> Hvis du ønsker å teste dette loktalt, er det viktig at filen har endingen `.tsx`, og ikke `.jsx`.

Her er koden for `Profile`-komponenten:

  ```typescript
  import React, { FC } from 'react';

  interface ProfileProps {
    name: string;
    age: number;
    experience: {
      title: string;
      years: number;
    }[];
  }

  const Profile: FC<ProfileProps> = ({ name, age, experience }) => {
    return (
      <div>
        <h1>{name}</h1>
        <p>Age: {age}</p>
        <ul>
          {experience.map((exp, index) => (
            <li key={index}>
              {exp.title} - {exp.years} years
            </li>
          ))}
        </ul>
      </div>
    );
  };

  export default Profile;

  const App = () => {
    return (
      <Profile
        name="John Doe"
        age="30"
        experience={[
          { title: "Developer", years: "5" }, 
          { title: "Manager", years: 3 }
        ]}
      />
    );
  };

  export default App;
  ```

  <details><summary>Løsning</summary>

  Feilen i koden er at `age`- og `years`-propene ikke blir sendt inn i riktig format. Her er den korrigerte koden:

  ```typescript
  import React, { FC } from 'react';

  interface ProfileProps {
    name: string;
    age: number;
    experience: {
      title: string;
      years: number;
    }[];
  }

  const Profile: FC<ProfileProps> = ({ name, age, experience }) => {
    return (
      <div>
        <h1>{name}</h1>
        <p>Age: {age}</p>
        <ul>
          {experience.map((exp, index) => (
            <li key={index}>
              {exp.title} - {exp.years} years
            </li>
          ))}
        </ul>
      </div>
    );
  };

  export default Profile;

  // Usage example with correct props
  const App = () => {
    return (
      <Profile
        name="John Doe"
        age={30} // Corrected: age is now a number
        experience={[
          { title: "Developer", years: 5 }, // Corrected: years is now a number
          { title: "Manager", years: 3 }
        ]}
      />
    );
  };

  export default App;
  ```

  **Forklaring:**  
  Etter å ha rettet opp feilen, vil `Profile`-komponenten nå vise brukerens navn, alder og arbeidserfaring korrekt. Sørg for at dataene som sendes inn som props samsvarer med `ProfileProps`-grensesnittet.

  </details>
