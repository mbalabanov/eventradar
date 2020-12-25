<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Location
 *
 * @ORM\Table(name="location", indexes={@ORM\Index(name="location-country", columns={"_countryId"})})
 * @ORM\Entity
 */
class Location
{
    /**
     * @var int
     *
     * @ORM\Column(name="locationId", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $locationid;

    /**
     * @var string
     *
     * @ORM\Column(name="name", type="string", length=255, nullable=false)
     */
    private $name;

    /**
     * @var string|null
     *
     * @ORM\Column(name="imageUrl", type="string", length=255, nullable=true, options={"default"="NULL"})
     */
    private $imageurl = 'NULL';

    /**
     * @var int|null
     *
     * @ORM\Column(name="maxAudienceCapacity", type="integer", nullable=true, options={"default"="NULL"})
     */
    private $maxaudiencecapacity = 'NULL';

    /**
     * @var string|null
     *
     * @ORM\Column(name="website", type="string", length=255, nullable=true, options={"default"="NULL"})
     */
    private $website = 'NULL';

    /**
     * @var string|null
     *
     * @ORM\Column(name="phone", type="string", length=255, nullable=true, options={"default"="NULL"})
     */
    private $phone = 'NULL';

    /**
     * @var string|null
     *
     * @ORM\Column(name="email", type="string", length=255, nullable=true, options={"default"="NULL"})
     */
    private $email = 'NULL';

    /**
     * @var string|null
     *
     * @ORM\Column(name="street", type="string", length=255, nullable=true, options={"default"="NULL"})
     */
    private $street = 'NULL';

    /**
     * @var string|null
     *
     * @ORM\Column(name="streetNo", type="string", length=255, nullable=true, options={"default"="NULL"})
     */
    private $streetno = 'NULL';

    /**
     * @var string|null
     *
     * @ORM\Column(name="postalCode", type="string", length=255, nullable=true, options={"default"="NULL"})
     */
    private $postalcode = 'NULL';

    /**
     * @var string
     *
     * @ORM\Column(name="city", type="string", length=255, nullable=false)
     */
    private $city;

    /**
     * @var string|null
     *
     * @ORM\Column(name="description", type="text", length=65535, nullable=true, options={"default"="NULL"})
     */
    private $description = 'NULL';

    /**
     * @var \Country
     *
     * @ORM\ManyToOne(targetEntity="Country")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="_countryId", referencedColumnName="countryId")
     * })
     */
    private $countryid;

    public function getLocationid(): ?int
    {
        return $this->locationid;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getImageurl(): ?string
    {
        return $this->imageurl;
    }

    public function setImageurl(?string $imageurl): self
    {
        $this->imageurl = $imageurl;

        return $this;
    }

    public function getMaxaudiencecapacity(): ?int
    {
        return $this->maxaudiencecapacity;
    }

    public function setMaxaudiencecapacity(?int $maxaudiencecapacity): self
    {
        $this->maxaudiencecapacity = $maxaudiencecapacity;

        return $this;
    }

    public function getWebsite(): ?string
    {
        return $this->website;
    }

    public function setWebsite(?string $website): self
    {
        $this->website = $website;

        return $this;
    }

    public function getPhone(): ?string
    {
        return $this->phone;
    }

    public function setPhone(?string $phone): self
    {
        $this->phone = $phone;

        return $this;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(?string $email): self
    {
        $this->email = $email;

        return $this;
    }

    public function getStreet(): ?string
    {
        return $this->street;
    }

    public function setStreet(?string $street): self
    {
        $this->street = $street;

        return $this;
    }

    public function getStreetno(): ?string
    {
        return $this->streetno;
    }

    public function setStreetno(?string $streetno): self
    {
        $this->streetno = $streetno;

        return $this;
    }

    public function getPostalcode(): ?string
    {
        return $this->postalcode;
    }

    public function setPostalcode(?string $postalcode): self
    {
        $this->postalcode = $postalcode;

        return $this;
    }

    public function getCity(): ?string
    {
        return $this->city;
    }

    public function setCity(string $city): self
    {
        $this->city = $city;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(?string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getCountryid(): ?Country
    {
        return $this->countryid;
    }

    public function setCountryid(?Country $countryid): self
    {
        $this->countryid = $countryid;

        return $this;
    }


}
