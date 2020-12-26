<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Contest
 *
 * @ORM\Table(name="contest")
 * @ORM\Entity
 */
class Contest
{
    /**
     * @var int
     *
     * @ORM\Column(name="contestId", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $contestid;

    /**
     * @var string
     *
     * @ORM\Column(name="name", type="string", length=255, nullable=false)
     */
    private $name;

    /**
     * @var string|null
     *
     * @ORM\Column(name="imageUrl", type="string", length=255, nullable=true)
     */
    private $imageurl;

    /**
     * @var string|null
     *
     * @ORM\Column(name="federationName", type="string", length=255, nullable=true)
     */
    private $federationname;

    /**
     * @var string|null
     *
     * @ORM\Column(name="website", type="string", length=255, nullable=true, options={"default"="NULL"})
     */
    private $website;

    public function getContestid(): ?int
    {
        return $this->contestid;
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

    public function getFederationname(): ?string
    {
        return $this->federationname;
    }

    public function setFederationname(?string $federationname): self
    {
        $this->federationname = $federationname;

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


}
