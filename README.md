# Inheritable Submissions Form Generator

A flexible, low-code form generator designed to capture complex regulatory documents and hierarchical data structures. Built using the Flutter SDK, this tool allows for dynamic form creation, real-time collaboration, and seamless data storage in a relational database.

## Table of Contents

- [Features](#features)
- [Demo](#demo)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
  - [Form Configuration](#form-configuration)
  - [Running the Application](#running-the-application)
- [Contact](#contact)

## Features

- **Hierarchical Form Structures**: Supports unlimited nested multiple-choice questions and sub-questions.
- **Conditional Logic**: Show or hide fields and predefined values based on user responses.
- **Detail Fields**: Attach detailed information like free-text fields, time spans, or quantity inputs to any answer without adjusting the form structure.
- **Inheritance**: Reference other submissions to inherit, extend, or overwrite properties.
- **Real-Time Collaboration**: Multiple users can work on a submission simultaneously with real-time synchronization.
- **Submission Overview**: An overview table of all submissions allows for easy comparison, filtering, and correction.
- **Relational Database Storage**: Collected data is automatically stored in a relational database for easy access and analysis.

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (version 2.0 or higher)
- [Dart SDK](https://dart.dev/get-dart)
- [PostgreSQL](https://www.postgresql.org/download/) database

### Installation

1. **Clone the Repository**

   ```bash
   git clone https://github.com/yourusername/form-generator.git
   cd form-generator
   ```

2. **Install Dependencies**

   ```bash
   flutter pub get
   ```

3. **Set Up the Database**

   - Install PostgreSQL and create a new database.
   - Connect to that database in the login view. The tables will be generated automatically.

## Usage

### Form Configuration

The form generator uses a JSON configuration to define the form structure, including questions, answer options, and conditional logic.
The JSON configuration is stored in the `survey` table.
Create a row in the `survey` table and add a JSON configuration in the `structure` column.

**Example Configuration:**

```json
{
  "type": "Survey",
  "questions": [
    {
      "id": "fertilization",
      "type": "MultipleChoiceQuestion",
      "title": "Fertilization",
      "choices": [
        {
          "title": "Restriction to Specific Fertilizers",
          "subQuestions": [
            {
              "id": "fertilization-type",
              "type": "MultipleChoiceQuestion",
              "title": "Fertilizer Type",
              "choices": [
                {
                  "title": "Organic",
                  "subQuestions": [
                    {
                      "id": "organic-fertilizer_type",
                      "type": "MultipleChoiceQuestion",
                      "title": "Organic Fertilizer Type",
                      "choices": [
                        {"title": "Animal, solid (manure)"},
                        {"title": "Animal, liquid (e.g., slurry)"},
                        {"title": "Plant-based (digestate, compost)"}
                      ]
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    }
  ]
}
```

### Understanding the Configuration

The provided configuration is an example of a form used to collect data on fertilization practices. Below is an explanation of each feature that the configuration enables:

#### 1. Hierarchical Form Structures

The configuration supports hierarchical questions and sub-questions, allowing for unlimited nesting.

- **Main Question (`Fertilization`)**: A multiple-choice question with choices related to fertilization practices.
- **Sub-Questions**:
  - When "Restriction to Specific Fertilizers" is selected, a sub-question "Fertilizer Type" appears.
  - Selecting "Organic" under "Fertilizer Type" leads to another sub-question "Organic Fertilizer Type".
  - This continues to further specify the type of organic fertilizer.

**Example:**

```json
{
  "id": "fertilization",
  "type": "MultipleChoiceQuestion",
  "title": "Fertilization",
  "choices": [
    {
      "title": "Restriction to Specific Fertilizers",
      "subQuestions": [
        {
          "id": "fertilization-type",
          "type": "MultipleChoiceQuestion",
          "title": "Fertilizer Type",
          "choices": [
            {
              "title": "Organic",
              "subQuestions": [
                {
                  "id": "organic-fertilizer_type",
                  "type": "MultipleChoiceQuestion",
                  "title": "Organic Fertilizer Type",
                  "choices": [
                    { "title": "Animal, solid (manure)" },
                    { "title": "Animal, liquid (e.g., slurry)" },
                    { "title": "Plant-based (digestate, compost)" }
                  ]
                }
              ]
            }
          ]
        }
      ]
    }
  ]
}
```

This hierarchical structure allows the form to adapt dynamically based on the user's selections, providing a tailored data collection experience.

#### 2. Conditional Logic with `enabledIf`

The configuration allows certain questions to be displayed only when specific conditions are met, using the `enabledIf` property.

**Example:**

```json
{
  "id": "fertilization",
  "type": "MultipleChoiceQuestion",
  "title": "Fertilization",
  "enabledIf": {
    "type": "CheckAllConditions",
    "conditions": [
      {
        "type": "ContainsAnyOf",
        "field": "target_area",
        "values": ["al", "gl"]
      },
      {
        "type": "ContainsAnyOf",
        "field": "target_unit",
        "values": ["ha"]
      }
    ]
  }
}
```

In this example:

- The "Fertilization" question is only enabled if:
  - The `target_area` field contains either "al" (arable land) or "gl" (grassland).
  - The `target_unit` field contains "ha" (hectares).

This ensures that users only see relevant questions based on their previous answers, reducing confusion and improving data quality.

#### 3. Detail Fields with Constraints (`allowedConcretisations`)

The configuration allows you to specify where detailed information (concretizations) can be added, and to enable or disable specific types of detail fields at each node.

**Example:**

```json
{
  "id": "fertilization",
  "type": "MultipleChoiceQuestion",
  "title": "Fertilization",
  "allowedConcretisations": { "timespan": false },
  "choices": [
    {
      "title": "Restriction to Specific Fertilizers",
      "subQuestions": [
        {
          "id": "fertilization-type",
          "type": "MultipleChoiceQuestion",
          "title": "Fertilizer Type",
          "choices": [
            {
              "title": "Organic",
              "subQuestions": [
                {
                  "id": "organic-fertilizer_type",
                  "type": "MultipleChoiceQuestion",
                  "title": "Organic Fertilizer Type",
                  "allowedConcretisations": { "timespan": true },
                  "choices": [
                    { "title": "Animal, solid (manure)" },
                    { "title": "Animal, liquid (e.g., slurry)" },
                    { "title": "Plant-based (digestate, compost)" }
                  ]
                }
              ]
            }
          ]
        }
      ]
    }
  ]
}
```

In this example:

- At the "Fertilization" level, the addition of timespan detail fields is disabled (`"timespan": false`).
- At the "Organic Fertilizer Type" level, the addition of timespan detail fields is enabled (`"timespan": true`).

This allows fine-grained control over where users can add specific types of detailed information, ensuring that data is collected in the appropriate context.

### Running the Application

1. **Start the Application**

   ```bash
   flutter run
   ```

## Contact

For questions or support, please contact:

- **Alexander Aue-Johr** - [alexander.aue@thuenen.de](mailto:alexander.aue@thuenen.de)













 