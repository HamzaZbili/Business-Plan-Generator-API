DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS businesPlans;
DROP TABLE IF EXISTS requests;
DROP TABLE IF EXISTS prompts;


CREATE TABLE users (
    user_id serial,
    Name text NOT NULL,
    PRIMARY KEY (Continent_id)
);
CREATE TABLE requests (
    request_id serial,
    capital text NOT NULL,
    description text NOT NULL,
    steps text NOT NULL,
    PRIMARY KEY (request_id)
    FOREIGN KEY (user) REFERENCES users(user_id)
)

CREATE TABLE businesPlans (
    businesPlan_id serial,
    plan text NOT NULL,
    PRIMARY KEY (businesPlans_id),
    FOREIGN KEY (user) REFERENCES users(user_id)
    FOREIGN KEY (request) REFERENCES requests(request_id)
);

CREATE TABLE prompts (
    prompts_id serial,
    question text NOT NULL,
    financialPlan boolean,
    mission boolean,
    strategy boolean,
    market boolean,
    PRIMARY KEY (prompts_id),
    FOREIGN KEY (user) REFERENCES users(user_id)
    FOREIGN KEY (businesPlan) REFERENCES businesPlans(businesPlan_id)
)