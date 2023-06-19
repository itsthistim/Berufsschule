<div class="formbold-main-wrapper">
    <div class="formbold-form-wrapper">

        <!-- <img src="your-image-url-here.jpg"> -->

        <form method="GET">
            <div class="formbold-form-title">
                <h2 class="">Register now</h2>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
                    eiusmod tempor incididunt.
                </p>
            </div>

            <div class="formbold-input-flex">
                <div>
                    <label for="firstname" class="formbold-form-label">
                        First name
                    </label>
                    <input type="text" name="firstname" id="firstname" class="formbold-form-input" />
                </div>
                <div>
                    <label for="lastname" class="formbold-form-label"> Last name </label>
                    <input type="text" name="lastname" id="lastname" class="formbold-form-input" />
                </div>
            </div>

            <div class="formbold-input-flex">
                <div>
                    <label for="username" class="formbold-form-label"> User name </label>
                    <input type="text" name="username" id="username" class="formbold-form-input" />
                </div>
                <div>
                    <label for="email" class="formbold-form-label"> Email </label>
                    <input type="text" name="email" id="email" class="formbold-form-input" />
                </div>
            </div>

            <div class="formbold-input-flex">
                <div>
                    <label for="country" class="formbold-form-label"> Country </label>
                    <select name="country" id="country" class="formbold-form-input">
                        <option value="" disabled selected>Select your country</option>
                        <option value="AT">Austria</option>
                        <option value="DE">Germany</option>
                        <option value="CH">Switzerland</option>
                        <option value="LU">Luxembourg</option>
                    </select>
                </div>
                <div>
                    <label for="education" class="formbold-form-label"> Education </label>
                    <select name="education" id="education" class="formbold-form-input">
                        <option value="" disabled selected>Select your education</option>
                        <option value="highschool">High School</option>
                        <option value="bachelors">Bachelors</option>
                        <option value="masters">Masters</option>
                        <option value="phd">PhD</option>
                    </select>

                </div>
            </div>

            <div class="formbold-mb-3">
                <label for="address2" class="formbold-form-label">
                    Which of the following books did you enjoy most?<br>
                    <input type="radio" name="book" value="harrypotter" id="harrypotter"
                        style="margin-right: 10px;" /><label for="harrypotter"> Harry Potter</label><br>
                    <input type="radio" name="book" value="pjackson" id="pjackson" style="margin-right: 10px;" /><label
                        for="pjackson"> Percy Jackson</label><br>
                    <input type="radio" name="book" value="lotr" id="lotr" style="margin-right: 10px;" /><label
                        for="lotr"> Lord of the Rings</label><br>
                    <input type="radio" name="book" value="none" id="none" style="margin-right: 10px;" /><label
                        for="none"> None of the above</label>
                </label>
            </div>

            <div class="formbold-checkbox-wrapper">
                <label for="supportCheckbox" class="formbold-checkbox-label">
                    <div class="formbold-relative">
                        <input type="checkbox" id="supportCheckbox" class="formbold-input-checkbox" />
                        <div class="formbold-checkbox-inner">
                            <span class="formbold-opacity-0">
                                <svg width="11" height="8" viewBox="0 0 11 8" fill="none"
                                    class="formbold-stroke-current">
                                    <path
                                        d="M10.0915 0.951972L10.0867 0.946075L10.0813 0.940568C9.90076 0.753564 9.61034 0.753146 9.42927 0.939309L4.16201 6.22962L1.58507 3.63469C1.40401 3.44841 1.11351 3.44879 0.932892 3.63584C0.755703 3.81933 0.755703 4.10875 0.932892 4.29224L0.932878 4.29225L0.934851 4.29424L3.58046 6.95832C3.73676 7.11955 3.94983 7.2 4.1473 7.2C4.36196 7.2 4.55963 7.11773 4.71406 6.9584L10.0468 1.60234C10.2436 1.4199 10.2421 1.1339 10.0915 0.951972ZM4.2327 6.30081L4.2317 6.2998C4.23206 6.30015 4.23237 6.30049 4.23269 6.30082L4.2327 6.30081Z"
                                        stroke-width="0.4"></path>
                                </svg>
                            </span>
                        </div>
                    </div>
                    I want to sign up to the newsletter.
                </label>
            </div>


            <!-- three checkboxes to select a favorite color -->
            <label for="color" class="formbold-form-label">Favorite color:</label>
            <input type="checkbox" name="color" value="red" id="red" style="margin-right: 10px;" /><label for="red">
                Red</label><br>
            <input type="checkbox" name="color" value="blue" id="blue" style="margin-right: 10px;" /><label for="blue">
                Blue</label><br>
            <input type="checkbox" name="color" value="green" id="green" style="margin-right: 10px;" /><label
                for="green"> Green</label><br>



            <button class="formbold-btn">Register Now</button>
        </form>
    </div>
</div>